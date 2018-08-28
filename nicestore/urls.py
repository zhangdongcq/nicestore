"""nicestore URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
# from django.contrib import admin
import xadmin
from nicestore.settings import MEDIA_ROOT
from django.views.static import serve
from rest_framework.documentation import include_docs_urls
from goods.views import GoodsListViewSet, GoodsCategoryViewSet, BannerViewset
from rest_framework.routers import DefaultRouter
from rest_framework_jwt.views import obtain_jwt_token
from user_operation.views import UserFavViewset, LeavingMessageViewset, AddressViewset
from users.views import UserViewset
from trade.views import ShoppingCartViewset, OrderViewset
router = DefaultRouter()
router.register(r'goods', GoodsListViewSet, base_name='goods')
router.register(r'userfavs', UserFavViewset, base_name="userfavs")
router.register(r'categorys', GoodsCategoryViewSet, base_name='categories')
router.register(r'users', UserViewset, base_name='categories')
router.register(r'messages', LeavingMessageViewset, base_name='messages')
router.register(r'address', AddressViewset, base_name='address')
router.register(r'shopcarts', ShoppingCartViewset, base_name='shopcarts')
router.register(r'banners', BannerViewset, base_name='banners')
router.register(r'orders', OrderViewset, base_name='orders')

urlpatterns = [
    url(r'^xadmin/', xadmin.site.urls),
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),

    # Product List
    url(r'^docs/', include_docs_urls(title='NiceStore')),
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^login', obtain_jwt_token),

]
