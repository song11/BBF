
from django.conf.urls import url
from django.contrib import admin

from app import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^base/$', views.base, name='base'),
    url(r'^register/$', views.register, name='register'),
    url(r'^login/$', views.login, name='login'),
    url(r'^cart/$', views.cart, name='cart'),
    url(r'^product_details/$', views.product_details, name='product_details'),

]
