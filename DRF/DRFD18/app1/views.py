from django.shortcuts import render
from rest_framework import generics, viewsets

from app1.models import Goods
from app1.serializers import GoodsSerializer


# class GoodsList(generics.ListCreateAPIView):
#     queryset =Goods.objects.all()
#     serializer_class = GoodsSerializer
#
# class GoodsDetail(generics.RetrieveUpdateDestroyAPIView):
#     queryset = Goods.objects.all()
#     serializer_class = GoodsSerializer

class GoodsAPIView(viewsets.ModelViewSet):
    queryset = Goods.objects.all()
    serializer_class = GoodsSerializer


