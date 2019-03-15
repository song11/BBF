from django.shortcuts import render


def index(request):
    return render(request, 'index/index.html')


def register(request):
    return render(request, 'register/register.html')


def base(request):
    return render(request, 'base/base.html')


def login(request):
    return render(request, 'login/login.html')


def cart(request):
    return render(request, 'cart/cart.html')


def product_details(request):
    return render(request, 'product_details/product_details.html')