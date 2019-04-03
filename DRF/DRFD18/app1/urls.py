from django.conf.urls import url

from app1 import views

urlpatterns=[
    # url(r'^goods/$',views.GoodsList.as_view()),
    # url(r'^goods/(?P<pk>\d+)/$',views.GoodsDetail.as_view()),

    url(r'^goods/$',views.GoodsAPIView.as_view({
        'get':'list',#获取列表
        'post':'create',#创建模型

    })),
    url(r'^goods/(?P<pk>\d+)/$',views.GoodsAPIView.as_view({
        'get':'retrieve',    #获取单个
        'delete':'destroy',  # 删除
        'patch':'partial_update',  #局部更新
        'put':'update',     #patch 更新整个
    }))
]