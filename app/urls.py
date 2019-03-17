
from django.conf.urls import url
from django.contrib import admin

from app import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^base/$', views.base, name='base'),

    url(r'^register/$', views.register, name='register'),
    url(r'^checkmobile/$', views.checkmobile, name='checkmobile'),
    url(r'^login/$', views.login, name='login'),
    url(r'^logout/$', views.logout, name='logout'),

    url(r'^cart/$', views.cart, name='cart'),
    url(r'^product_details/(?P<good_id>\d+)/$', views.product_details, name='product_details'),

    url(r'^addcart/$', views.addcart, name='addcart'),
    # url(r'^subcart/$', views.subcart, name='subcart'),
    # url(r'^changecartselect/$', views.changecartselect, name='changecartselect'),
    # url(r'^changecartall/$', views.changecartall, name='changecartall'),  # 全选/取消全选

    url(r'^generateorder/$',views.generateorder,name='generateorder'),
    url(r'^orderlist/$',views.orderlist,name='orderlist'),
    url(r'^orderdetail/(?P<identifier>\d+)/$',views.orderdetail,name='orderdetail'),

]
