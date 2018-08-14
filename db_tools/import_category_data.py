# _*_ coding: utf-8 _*_
__author__='bobby'

import sys
import os
import pymysql
pymysql.install_as_MySQLdb()

pwd = os.path.dirname(os.path.realpath(__file__))
sys.path.append(pwd+"../")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "nicestore.settings")

import django
django.setup()



from goods.models import GoodsCategory

from db_tools.data.category_data import row_data

for level1_cat in row_data:
    level1_instance = GoodsCategory()
    level1_code = level1_cat['code']
    level1_name = level1_cat['name']
    level1_instance.category_type = 1
    level1_instance.save()

    for level2_cat in level1_cat['sub_categorys']:
        level2_instance = GoodsCategory()
        level2_code = level2_cat['code']
        level2_name = level2_cat['name']
        level2_instance.category_type = 2
        level2_instance.parent_category = level1_instance
        level2_instance.save()

