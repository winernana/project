from django.db import models

class Wheel(models.Model):
    img = models.CharField(max_length=100)

    desc =models.CharField(max_length=256)

    detailid = models.IntegerField()