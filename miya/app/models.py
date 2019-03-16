from django.db import models

class BaseModel(models.Model):
    img=models.CharField(max_length=200)
    name=models.CharField(max_length=100)
    trackid=models.CharField(max_length=20)

    class Meta:
        # 抽象类
        abstract = True

# 轮播图 模型类
class Wheel(BaseModel):

    class Meta:
        db_table = 'miya_wheel'


class Shop(BaseModel):
    class Meta:
        db_table = 'miya_shop'

# 商品列表，模型类
class Mainshow(BaseModel):
    trackid = models.CharField(max_length=100)
    name=models.CharField(max_length=100)
    img=models.CharField(max_length=100)
    categoryid=models.CharField(max_length=20)
    brandname=models.CharField(max_length=100)

    img1=models.CharField(max_length=100)
    childcid1=models.CharField(max_length=100)
    productid1=models.CharField(max_length=20)
    longname1=models.CharField(max_length=100)
    price1=models.CharField(max_length=20)
    marketprice1=models.CharField(max_length=100)

    img2 = models.CharField(max_length=100)
    childcid2 = models.CharField(max_length=100)
    productid2 = models.CharField(max_length=20)
    longname2 = models.CharField(max_length=100)
    price2 = models.CharField(max_length=20)
    marketprice2 = models.CharField(max_length=100)

    img3 = models.CharField(max_length=100)
    childcid3 = models.CharField(max_length=100)
    productid3 = models.CharField(max_length=20)
    longname3 = models.CharField(max_length=100)
    price3 = models.CharField(max_length=20)
    marketprice3 = models.CharField(max_length=100)

    class Meta:
        db_table='miya_mainshow'

    def __str__(self):
        return self.name

class Goods(models.Model):

    # 商品图片
    productimg=models.CharField(max_length=200)
    # 商品名称
    productname=models.CharField(max_length=100)
    # 商品长名字
    productlongname=models.CharField(max_length=200)
    # 商品价格
    price = models.DecimalField(max_digits=6,decimal_places=2)
    # 超市价格
    marketprice = models.FloatField()
    # 销售量
    productnum = models.IntegerField()

    class Meta:
        db_table='miya_goods'


class User(models.Model):
    tel = models.CharField(max_length=20,unique=True )
    password = models.CharField(max_length=100)

    class Meta:
        db_table = 'miya_user'