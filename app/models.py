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


# 商品模型类
class GOODs(models.Model):
    # 商品ID
    productid = models.CharField(max_length=10)
    # 商品图片
    productimg = models.CharField(max_length=100)
    # 商品名称
    productname = models.CharField(max_length=100)
    # 商品长名字
    productlongname = models.CharField(max_length=100)
    # 广告语
    ads = models.CharField(max_length=100)
    # 规格
    specifics = models.CharField(max_length=100)
    # 价格
    price = models.FloatField()
    # 超市价格
    marketprice = models.FloatField()
    # 一级分类
    categoryname_1st = models.CharField(max_length=50)
    # 二级分类
    categoryname_2st = models.CharField(max_length=50)
    # 三级分类
    categoryname_3st = models.CharField(max_length=50)
    # 库存量
    storenums = models.IntegerField()
    #商家名字
    seller = models.CharField(max_length=50)
    #商家地址
    selleraddr = models.CharField(max_length=100)
    #商家联系人
    sellername = models.CharField(max_length=50)
    class Meta:
        db_table = 'goods_5'

#购物车
class Cart(models.Model):
    user = models.ForeignKey(User)
    goods = models.ForeignKey(GOODs)
    number = models.IntegerField()
    isselect = models.BooleanField(default=True)
    isdelect = models.BooleanField(default=False)

    class Meta:
        db_table = 'cart'

class Order(models.Model):
    user = models.ForeignKey(User)
    createtime = models.DateTimeField(auto_now_add=True)
    updatetime = models.DateTimeField(auto_now=True)
    status = models.IntegerField(default=0)
    identifier = models.CharField(max_length=256)


class OrderGoods(models.Model):
    order = models.ForeignKey(Order)
    goods = models.ForeignKey(GOODs)
    number = models.IntegerField()