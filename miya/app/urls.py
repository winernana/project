from django.conf.urls import url

from app import views

urlpatterns=[
    url(r'^$',views.home,name='home'),  #首页

    url(r'^register/$',views.register,name='register'), #注册

    url(r'^login/$',views.login,name='login'),  #登陆
    url(r'^shoppingCar/$',views.shoppingCar,name='shoppingCar'),  #购物车
    url(r'^xiangqing/$',views.xiangqing,name='xiangqing'),   #详情
]