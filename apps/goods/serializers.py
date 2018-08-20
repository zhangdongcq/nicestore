# -*- coding:utf-8 -*-
from rest_framework import serializers
from goods.models import Goods, GoodsCategory, GoodsImage


class GoodsCategorySerializer3(serializers.ModelSerializer):
    '''Third Level of Category'''

    class Meta:
        model = GoodsCategory
        fields = "__all__"


class GoodsCategorySerializer2(serializers.ModelSerializer):
    '''Second Level of Category'''
    sub_cat = GoodsCategorySerializer3(many=True)

    class Meta:
        model = GoodsCategory
        fields = "__all__"


class GoodsCategorySerializer(serializers.ModelSerializer):
    '''First(Root) Level of Category'''
    sub_cat = GoodsCategorySerializer2(many=True)

    class Meta:
        model = GoodsCategory
        fields = "__all__"


class GoodsImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsImage
        fields = ('image',)


class GoodsSerializer(serializers.ModelSerializer):
    images = GoodsImageSerializer(many=True)

    class Meta:
        model = Goods
        fields = "__all__"
