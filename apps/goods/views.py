# -*- coding:utf-8 -*-
from django.shortcuts import render
from rest_framework.pagination import PageNumberPagination
from rest_framework import mixins, generics, viewsets, filters
from rest_framework.response import Response
from django_filters.rest_framework import DjangoFilterBackend
from .models import Goods, GoodsCategory, Banner
from .filters import GoodsFilter
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from .serializers import GoodsSerializer, GoodsCategorySerializer, BannerSerializer, IndexCategorySerializer
from rest_framework.authentication import TokenAuthentication


# Create your views here.

class GoodsPagination(PageNumberPagination):
    page_size = 12
    page_size_query_param = 'page_size'
    page_query_param = 'page'
    max_page_size = 100


class GoodsListViewSet(CacheResponseMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    '''
    list：
        Product List, pagination, search, filtering
    retrieve:
        Get product detail
    '''
    serializer_class = GoodsSerializer
    pagination_class = GoodsPagination
    queryset = Goods.objects.all()
    # authentication_class = (TokenAuthentication, )
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    filter_class = GoodsFilter
    search_fields = ('name', 'goods_desc', 'goods_brief')
    ordering_fields = ('sold_num', 'shop_price')

    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.click_num += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class GoodsCategoryViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    '''
    list:
        Data for goods categories
    '''
    queryset = GoodsCategory.objects.filter(category_type=1)
    serializer_class = GoodsCategorySerializer


class BannerViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    '''
    list:
        return Banners' Info
    '''
    queryset = Banner.objects.all().order_by("index")
    serializer_class = BannerSerializer


class IndexCategoryViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    Categories Data at HomePage
    """
    # How Many Sections : name__in
    queryset = GoodsCategory.objects.filter(is_tab=True, name__in=["酒水饮料", "生鲜食品"])
    serializer_class = IndexCategorySerializer
