import datetime
import hashlib
import random
import time
from urllib.parse import parse_qs
from app.alipay import alipay
from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from app.models import indexBanerSll, indexDrb, indexLouti, indexMrb, User, GOODs, Cart, Order, OrderGoods


def base(request):
    token = request.session.get('token')
    userid = cache.get(token)
    response_data = {
        'user': None
    }

    if userid:
        user = User.objects.get(pk=userid)
        response_data['user'] = user

    return render(request, 'base/base.html', context=response_data)

def index(request):
    # 轮播图数据
    baners = indexBanerSll.objects.all()
    #品牌商家推荐
    mrecommends = indexDrb.objects.all()
    #每日优惠
    daySales = indexLouti.objects.all()
    #LOGO
    logos = indexMrb.objects.all()


    data = {
        'title': '首页',
        'baners': baners,
        'mrecommends': mrecommends[0:3],
        'daySales': daySales[0:5],
        'logos': logos,
        'user':None
    }

    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        data['user'] = user

    return render(request, 'index/index.html',context=data)

def generate_password(param):
    md5 = hashlib.md5()
    md5.update(param.encode('utf-8'))
    return md5.hexdigest()


def generate_token():
    token = str(time.time())+str(random.random())
    md5 = hashlib.md5()
    md5.update(token.encode('utf-8'))
    return md5.hexdigest()

def register(request):
    if request.method == 'GET':
        return render(request,'register/register.html')
    elif request.method == 'POST':
        mobile = request.POST.get('mobile')
        pwd = generate_password(request.POST.get('pwd'))
    #需要查看数据存储是否正确
        user = User()
        user.mobile = mobile
        user.pwd = pwd
        user.save()
        #状态保持
        token = generate_token()
        cache.set(token,user.id,60*60*24*3)
        request.session['token'] = token
        return redirect('bbf:index')
    return render(request, 'register/register.html')

def checkmobile(request):
    mobile = request.GET.get('mobile')
    users = User.objects.filter(mobile=mobile)
    if users.exists():
        response_data = {
            'status':0,
            'msg':'帐号被占用'
        }
    else:
        response_data = {
            'status':1,
            'msg':'帐号可用'
        }

    return JsonResponse(response_data)

def login(request):
    if request.method == 'GET':
        return render(request,'login/login.html')
    elif request.method == 'POST':
        account = request.POST.get('account')
        pwd = request.POST.get('pwd')
        #重定向
        back = request.COOKIES.get('back')

        users = User.objects.filter(mobile=account)

        if users.exists():
            user = users.first()
            if user.pwd == generate_password(pwd):
                token = generate_token()
                cache.set(token,user.id,60*60*24*3)
                #传递给客户端
                request.session['token'] = token
                print(111111)
                if back == 'product_details':
                    return redirect('bbf:product_detailsbase')
                elif back == 'cart':
                    return  redirect('bbf:cart')
                else:
                    return redirect('bbf:index')

            else:
                return render(request,'login/login.html',context={'ps_err':'密码错误'})

        else:
            return render(request,'login/login.html',context={'user_err':'用户名不存在'})
    return  render(request,'login/login.html')


def logout(request):
    request.session.flush()
    return redirect('bbf:login')


def product_details(request,good_id='1'):
    good_id = int(good_id)
    if good_id in range(1,6):
        goods_list = GOODs.objects.get(pk=good_id)
    else:
        return redirect('bbf:index')
    data = {
        'goods_list': goods_list,
    }

    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        carts = user.cart_set.all()
        data['carts'] = carts
        data['user'] = user

    return render(request, 'product_details/product_details.html',context=data)


def cart(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:
        user = User.objects.get(pk=userid)
        carts = user.cart_set.filter(number__gt=0)

        isall = True
        for cart in carts:
            if not cart.isselect:
                isall = False

        data = {
            'carts': carts,
            'isall': isall,
            'user':user,
        }

        return render(request, 'cart/cart.html', context=data)
    else:
        return render(request, 'login/login.html')

def cart_count(request):
    token = request.session.get('token')
    userid = cache.get(token)

    numbers = 0  # 商品总件数
    if userid:
        user = User.objects.get(pk=userid)
        carts = user.cart_set.all()

        for cart in carts:
            numbers += cart.number
        response_data = {
            'status': 1,
            'numbers': numbers
        }
    else:
        response_data = {
            'status': -1,
            'numbers': 0
        }
    return JsonResponse(response_data)

def mine(request):
    token = request.session.get('token')
    userid = cache.get(token)
    response_data = {
        'user' : None
    }

    if userid:
        user = User.objects.get(pk=userid)
        response_data['user'] = user
        orders = user.order_set.all()
        response_data['waitpay'] = orders.filter(status=0).count()  #待支付订单数
        response_data['paydone'] = orders.filter(status=1).count()  #已支付订单数
        response_data['receive'] = orders.filter(status=2).count()  #已支付订单数

    return render(request,'mine/mine.html',context=response_data)

def addgoods(request):
    token = request.session.get('token')
    response_data = {}
    if token:
        userid = cache.get(token)
        if userid:
            user = User.objects.get(pk=userid)
            goodsid = request.GET.get('goodsid')
            goodsnum = int(request.GET.get('goodsNum'))
            goods = GOODs.objects.get(pk=goodsid)
            # 判断需要添加的商品是否已经存在
            carts = Cart.objects.filter(user=user).filter(goods=goods)

            if carts.exists():
                cart = carts.first()
                cart.number += goodsnum
                cart.save()
            else:
                cart = Cart()
                cart.user = user
                cart.goods = goods
                cart.number = goodsnum
                cart.save()

            response_data['status'] = 1
            response_data['number'] = cart.number
            response_data['msg'] = '添加{}购物车成功:{}'.format(cart.goods.productlongname, cart.number)
            return JsonResponse(response_data)

    response_data['status'] = -1
    response_data['msg'] = '请登录后操作'
    return JsonResponse(response_data)



def addcart(request):
    goodsid = request.GET.get('goodsid')
    goods = GOODs.objects.get(pk=goodsid)

    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    # 判断需要添加的商品是否已经存在
    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    cart.number += 1
    cart.save()
    response_data = {
        'msg': '添加商品成功',
        'status': 1,
        'number': cart.number,
    }
    return JsonResponse(response_data)

def subcart(request):
    goodsid = request.GET.get('goodsid')
    goods = GOODs.objects.get(pk=goodsid)

    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    cart.number -= 1
    cart.save()

    response_data = {
        'msg':'删减商品成功',
        'status':1,
        'number':cart.number,
    }
    return JsonResponse(response_data)

def changecartselect(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()
    response_data = {
        'msg':'状态修改成功',
        'status':1,
        'isselect':cart.isselect
    }

    return JsonResponse(response_data)

def changecartall(request):
    isall = request.GET.get('isall')
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    carts = user.cart_set.all()

    if isall == 'true': #python 区分大小写
        isall = True
    else:
        isall = False
    for cart in carts:
        cart.isselect = isall
        cart.save()

    response_data = {
        'msg':'全选/取消全选 成功',
        'status':1,
    }
    return JsonResponse(response_data)


def generate_identifier():
    temp = str(datetime.datetime.now().strftime('%Y%m%d%H%M%S')) + str(random.randrange(1000, 10000))
    return temp

def generateorder(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    order = Order()
    order.user = user
    order.identifier = generate_identifier()
    order.save()

    carts = user.cart_set.filter(isselect=True)
    # 创建订单商品表
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()
        cart.delete()

    return render(request,'order/orderdetail.html',context={'order':order,'user':user})


def orderlist(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    orders = user.order_set.all()
    print(orders)
    return render(request,'order/orderlist.html',context={'orders':orders})


def orderdetail(request,identifier):
    order = Order.objects.filter(identifier=identifier).first()
    return render(request,'order/orderdetail.html',context={'order':order})

def returnurl(request):
    return redirect('bbf:mine')

@csrf_exempt
def appnotifyurl(request):
    if request.method =='POST':
        body_str = request.body.decode('utf-8')
        post_data = parse_qs(body_str)
        post_dic = {}
        for k,v in post_data.items():
            post_dic[k] = v[0]
        out_trade_no = post_dic['out_trade_no']
        Order.objects.filter(identifier=out_trade_no).update(status=1)

    return JsonResponse({'msg':'success'})

def pay(request):
    orderid = request.GET.get('orderid')
    order = Order.objects.get(pk=orderid)
    sum = 0
    for orderGoods in order.ordergoods_set.all():
        sum += orderGoods.goods.price * orderGoods.number

    data = alipay.direct_pay(
        subject='八百方网上电子交易平台',  # 显示标题
        out_trade_no=order.identifier,  # 订单号
        total_amount=str(sum),  # 支付金额
        return_url='http://120.79.141.194/bbf/returnurl/'
    )

    # 支付地址
    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=data)

    response_data = {
        'msg': '调用支付接口',
        'alipayurl': alipay_url,
        'status': 1
    }

    return JsonResponse(response_data)

