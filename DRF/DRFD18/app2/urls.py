from django.conf.urls import url

from app2 import views

urlpatterns=[
    url(r'^user/$',views.UserAPIView.as_view()),

    url(r'^movie/$',views.MovieAPIView.as_view({
        'get':'list',
        'post':'create'
    })),

    url(r'^movie/(?P<pk>\d)/$',views.MovieAPIView.as_view({
        'get':'retrieve',
        'patch':'partial_update',
        'put':'update',
        'delete':'destroy',
    }))
]