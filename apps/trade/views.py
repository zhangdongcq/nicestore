import time
from django.shortcuts import render
from rest_framework import viewsets
# Create your views here.
from rest_framework.permissions import IsAuthenticated
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from utils.permissions import IsOwnerOrReadOnly
from .serializers import ShoppingCartSerializer, ShopCartDetailSerializer, OrderSerializer, OrderDetailSerializer
from .models import ShoppingCart, OrderGoods
from rest_framework import mixins
from .models import OrderInfo


class ShoppingCartViewset(viewsets.ModelViewSet):
    """
    List:
        Return shopping cart detail
    Create:
        Add item(s) into shopping cart
    Delete:
        Delete shopping record
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = ShoppingCartSerializer
    lookup_field = 'goods_id'

    def perform_create(self, serializer):
        shop_cart = serializer.save()
        goods = shop_cart.goods
        if goods.goods_num > 0:
            goods.goods_num -= shop_cart.nums
        goods.save()

    def perform_destroy(self, instance):
        goods = instance.goods
        goods.goods_num += instance.nums
        instance.delete()

    def perform_update(self, serializer):
        exist_record = ShoppingCart.objects.get(id=serializer.instance.id)
        exist_nums = exist_record.nums
        saved_record = serializer.save()
        nums = saved_record.nums - exist_nums
        goods = saved_record.goods
        if goods.goods_num - nums > 0:
            goods.goods_num -= nums
        goods.save()




    def get_serializer_class(self):
        if self.action == "list":
            return ShopCartDetailSerializer
        else:
            return ShoppingCartSerializer

    def get_queryset(self):
        return ShoppingCart.objects.filter(user=self.request.user)


class OrderViewset(mixins.ListModelMixin, mixins.RetrieveModelMixin, mixins.CreateModelMixin, mixins.DestroyModelMixin, viewsets.GenericViewSet):
    """
    List:
        Return order info
    Delete:
        Delete Order
    Create:
        Create orders
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = OrderSerializer

    def get_serializer_class(self):
        if self.action == "retrieve":
            return OrderDetailSerializer
        return OrderSerializer

    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)

    def perform_create(self, serializer):
        order = serializer.save()
        shop_carts = ShoppingCart.objects.filter(user=self.request.user)
        for shop_cart in shop_carts:
            order_goods = OrderGoods()
            order_goods.goods = shop_cart.goods
            order_goods.goods_num = shop_cart.nums
            order_goods.order = order
            order_goods.save()
            shop_cart.delete()
        return order
