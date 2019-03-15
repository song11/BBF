from django.db import models

# 基础 类
class Base(models.Model):
    name = models.CharField(max_length=100)
    tits = models.CharField(max_length=200)
    price1 = models.CharField(max_length=20)
    price2 = models.CharField(max_length=20)
    img = models.CharField(max_length=100)

    class Meta:
        abstract = True

    def __str__(self):
        return self.name

# 品牌商家
class indexDrb(Base):
    class Meta:
        db_table = 'indexDrb'


# 每日优惠
class indexLouti(Base):
    class Meta:
        db_table = 'indexLouti'

#首页轮播图
class indexBanerSll(models.Model):
    img = models.CharField(max_length=100)
    title = models.CharField(max_length=100)
    backColor = models.CharField(max_length=50)
    class Meta:
        db_table = 'indexBanerSll'

#LOGO
class indexMrb(models.Model):
    img = models.CharField(max_length=100)
    class Meta:
        db_table = 'indexMrb'

#用户
class User(models.Model):
    mobile = models.CharField(max_length=20,unique=True)
    pwd = models.CharField(max_length=256)

    class Meta:
        db_table = 'user'