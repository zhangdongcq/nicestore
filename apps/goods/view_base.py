# -*- code: utf-8 -*-
from django.views.generic.base import View
from goods.models import Goods
import os

os.environ['DJANGO_SETTINGS_MODULE'] = 'nicestore.settings'

class GoodsListView(View):
    def get(self, request):
        '''
        Construct Product List Pages
        :param request:
        :return:
        '''
        json_list = []
        goods = Goods.objects.all()[:10]
        for good in goods:
            json_dict = {}
            json_dict['name'] = good.name
            json_dict['category'] = good.category.name
            json_dict['market_price'] = good.market_price
            json_list.append(json_dict)
        import json
        # from django.core import serializers
        # json_data = serializers.serialize('json', goods)
        # json_data = json.loads(json_data)

        # for good in goods:
        #     json_dict=model_to_dict(good)
        #     json_list.append(json_dict)
        from django.http import HttpResponse
        import json
        return HttpResponse(json.dumps(json_list), content_type='application/json')
