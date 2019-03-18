
from django.conf.urls import url
from django.contrib import admin

from app import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^base/$', views.base, name='base'),

    url(r'^mine/$',views.mine,name='mine'),     #我的八方
    url(r'^register/$', views.register, name='register'),
    url(r'^checkmobile/$', views.checkmobile, name='checkmobile'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),

    url(r'^cart/$', views.cart, name='cart'),
    url(r'^cart_count/$', views.cart_count, name='cart_count'),     #计算购物车总商品件数
    url(r'^product_details/(?P<good_id>\d+)/$', views.product_details, name='product_details'),
    url(r'^product_details/$', views.product_details, name='product_detailsbase'),
    url(r'^addgoods/$', views.addgoods, name='addgoods'),

    url(r'^addcart/$', views.addcart, name='addcart'),
    url(r'^subcart/$', views.subcart, name='subcart'),
    url(r'^changecartselect/$', views.changecartselect, name='changecartselect'),
    url(r'^changecartall/$', views.changecartall, name='changecartall'),  # 全选/取消全选

    url(r'^generateorder/$',views.generateorder,name='generateorder'),
    url(r'^orderlist/$',views.orderlist,name='orderlist'),
    url(r'^orderdetail/(?P<identifier>\d+)/$',views.orderdetail,name='orderdetail'),

    url(r'^returnurl/$', views.returnurl, name='returnurl'),    # 支付成功后，客户端的显示
    url(r'^appnotifyurl/$', views.appnotifyurl, name='appnotifyurl'), # 支付成功后，订单的处理
    url(r'^pay/$', views.pay, name='pay'),  # 支付

]
