import hashlib
import random
import time

from django.core.cache import cache
from django.http import HttpResponse
from django.shortcuts import render, redirect



from app.models import Wheel, Shop, Goods, User


def home(request):
    wheels = Wheel.objects.all()

    shops = Shop.objects.all()

    goods = Goods.objects.all()

    response_data={
        'wheels':wheels,
        'shops':shops,
        'goods':goods,
    }

    return render(request,'page.html',context=response_data)


def login(request):
    return render(request,'login.html')


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
    return render(request,'shoppingCart.html')


def xiangqing(request):
    return render(request,'xiangqing.html')

