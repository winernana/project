from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from app.models import Wheel, Shop, Goods


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


def register(request):
    return render(request,'register.html')


def shoppingCar(request):
    return render(request,'shoppingCart.html')


def xiangqing(request):
    return render(request,'xiangqing.html')

