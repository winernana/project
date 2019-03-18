import hashlib
import random
import time

from django.core.cache import cache
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render, redirect



from app.models import Wheel, Shop, Goods, User, Cart


def home(request):
    wheels = Wheel.objects.all()

    shops = Shop.objects.all()

    goods = Goods.objects.all()


    # 获取token
    token = request.session.get('token')
    userid = cache.get(token)
    user = None

    if userid:
        user = User.objects.get(pk=userid)



    response_data={
        'wheels':wheels,
        'shops':shops,
        'goods':goods,
        'user':user,
    }

    return render(request,'page.html',context=response_data)


def login(request):
    if request.method == 'GET':
        return render(request,'login.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = request.POST.get('password')

        # # 重新定向位置
        # back=request.COOKIES.get('back')

        users = User.objects.filter(tel=tel)
        if users.exists():
            user=users.first()
            if user.password == generate_password(password):   #密码正确
                token = generate_token()
                # 状态保持
                cache.set(token,user.id,60*60*24*3)
                request.session['token'] = token

                return  redirect('miya:home')
            else:
                return render(request,'login.html',context={'ps_err':'密码错误'})
        else:
            return  render(request,'login.html',context={'user_err':'用户不存在'})

def generate_password(param):
    md5 = hashlib.md5()
    md5.update(param.encode('utf-8'))
    return md5.hexdigest()


def generate_token():
    temp = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(temp.encode('utf-8'))
    return md5.hexdigest()

def register(request):
    if request.method == 'GET':
        return render(request,'register.html')
    elif request.method == 'POST':
        tel = request.POST.get('tel')
        password = generate_password(request.POST.get('password'))
        # password = request.POST.get('password')
        # 存入数据库
        user = User()
        user.tel = tel
        user.password = password
        user.save()

        # 状态保持
        token =generate_token()
        # token 和用户具有一一对应关系
        # key --> value -->过期时间
        cache.set(token,user.id ,60*60*24*3 )
        request.session['token'] = token

        return  redirect('miya:home')



def shoppingCar(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = None



    if userid:

        user = User.objects.get(pk=userid)

        carts = Cart.objects.filter(user=user)

    response_data={
        'user':user,
        'carts':carts,
    }

    return render(request,'shoppingCart.html',context=response_data)


def xiangqing(request,goodid=1):
    token = request.session.get('token')
    userid = cache.get(token)
    user = None

    goods = Goods.objects.get(pk=goodid)

    if userid:
        user = User.objects.get(pk=userid)

    response_data = {
        'user': user,
        'goods':goods,
    }
    return render(request,'xiangqing.html',context=response_data)


def addshoppingcart(request):

    # 获取token 找到userid
    token = request.session.get('token')

    if token:  #如果token存在，获取userid
        userid = cache.get(token)

        if userid:
            user = User.objects.get(pk=userid)
            goodid = request.GET.get('goodid')
            goods = Goods.objects.get(pk=goodid)
            number = request.GET.get('num')

            carts =  Cart.objects.filter(user=user).filter(goods=goods)



            # 如果商品存在，增加数量，如果商品不存在添加新记录
            if carts.exists():
                cart = carts.first()
                cart.number = cart.number + int(number)
                cart.save()
                response_data={
                    'num':number,
                }
                print('12156156')
                return JsonResponse(response_data)
            else:
                cart = Cart()
                cart.user = user
                cart.goods = goods
                cart.number = int(number)
                cart.save()

                # response_data='添加 {} 购物车成功: {}'.format(cart.goods.productlongname, cart.number)

