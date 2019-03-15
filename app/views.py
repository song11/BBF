import hashlib
import random
import time

from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import render, redirect

from app.models import indexBanerSll, indexDrb, indexLouti, indexMrb, User


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
        # back = request.COOKIES.get('back')

        users = User.objects.filter(mobile=account)
        if users.exists():
            user = users.first()
            if user.pwd == generate_password(pwd):
                token = generate_token()
                cache.set(token,user.id,60*60*24*3)
                #传递给客户端
                request.session['token'] = token
                # if back == 'login':
                #     return redirect('bbf:login')
                # else:
                #     return redirect('bbf')
                return redirect('bbf:index')
            else:
                return render(request,'login/login.html',context={'ps_err':'密码错误'})

        else:
            return render(request,'login/login.html',context={'user_err':'用户名不存在'})


def logout(request):
    request.session.flush()
    return redirect('bbf:login')

def base(request):
    return render(request, 'base/base.html')


def cart(request):
    return render(request, 'cart/cart.html')


def product_details(request):
    return render(request, 'product_details/product_details.html')