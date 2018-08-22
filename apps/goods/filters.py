# _*_ coding: utf-8 _*_

import django_filters
from .models import Goods
from django.db.models import Q


class GoodsFilter(django_filters.rest_framework.FilterSet):
    '''Pdocut filter'''
    pricemin = django_filters.NumberFilter(field_name='shop_price', help_text="lower bound of price", lookup_expr='gte')
    pricemax = django_filters.NumberFilter(field_name='shop_price', help_text="higher bound of price",
                                           lookup_expr='lte')
    name = django_filters.CharFilter(field_name='name', lookup_expr='iexact')
    top_category = django_filters.NumberFilter(method='top_category_filter')

    def top_category_filter(self, querytset, name, value):
        querytset = querytset.filter(Q(category_id=value) | Q(category__parent_category_id=value) | Q(
            category__parent_category__parent_category_id=value))
        return querytset

    class Meta:
        model = Goods
        fields = ['pricemin', 'pricemax', 'name', 'is_hot']
