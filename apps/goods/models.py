from datetime import datetime
from django.db import models

# Create your models here.
from DjangoUeditor.models import UEditorField


class GoodsCategory(models.Model):
    '''Categories of Products'''
    CATEGORY_TYPE = (
        (1, 'First Category'),
        (2, 'Second Category'),
        (3, 'Third Category'),
        (4, 'Fourth Category'),
    )
    name = models.CharField(max_length=30, verbose_name="Category Name", help_text='Category Name')
    code = models.CharField(max_length=30, verbose_name="Category Code", help_text='Category Code')
    desc = models.TextField(default="Some Category Description...", verbose_name="Category Description",
                            help_text="Category Description")
    category_type = models.IntegerField(choices=CATEGORY_TYPE, verbose_name='Category Type',
                                        help_text='Category Type')

    parent_category = models.ForeignKey("self", null=True, blank=True, verbose_name='Parent Category',
                                        related_name='sub_cat')
    is_tab = models.BooleanField(default=False, verbose_name='On NaviBar', help_text='On Navigation Bar')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = 'Goods Category'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class GoodsCategoryBrand(models.Model):
    '''Brand Name'''
    category = models.ForeignKey(GoodsCategory, related_name='brands', null=True, blank=True,
                                 verbose_name="Brand Category")
    name = models.CharField(default="", max_length=30, verbose_name='Brand Name', help_text='Brand Name')
    desc = models.TextField(default="", max_length=500, verbose_name='Brand Description', help_text='Brand Description')
    image = models.ImageField(max_length=200, upload_to='brands/')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = 'Product Brand'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Goods(models.Model):
    '''Product Definition'''
    GOODS_SIZE = (
        ('OneSize', 'OneSize'),
        ('29x32', '29x32'),
        ('30x32', '30x32'),
        ('31x32', '31x32'),
        ('32x32', '32x32'),
        ('33x32', '33x32'),
        ('34x32', '34x32'),
        ('36x32', '36x32'),
        ('38x32', '38x32'),
        ('xsmall', 'xsmall'),
        ('small', 'small'),
        ('medium', 'medium'),
        ('large', 'large'),
        ('xlarge', 'xlarge'),
        ('5', '5'),
        ('6', '6'),
        ('7', '7'),
        ('8', '8'),
        ('9', '9'),
        ('10', '10'),
        ('other', 'other'),
    )
    GOODS_COLOR = (
        ('OneColor', 'OneColor'),
        ('red', 'Red'),
        ('blue', 'Blue'),
        ('pink', 'pink'),
        ('black', 'black'),
        ('white', 'white'),
        ('green', 'green'),
        ('grey', 'grey'),
        ('other', 'other'),
    )
    category = models.ForeignKey(GoodsCategory, verbose_name='Product Category')
    brand = models.ForeignKey(GoodsCategoryBrand, null=True, blank=True, verbose_name='Product Brand')
    goods_sn = models.CharField(max_length=50, default="", verbose_name='Product SKU')
    name = models.CharField(max_length=300, default="", verbose_name="Product Name")
    goods_size = models.CharField(choices=GOODS_SIZE, default="OneSize", max_length=10, null=True, blank=True, verbose_name="Product Size")
    goods_color = models.CharField(choices=GOODS_COLOR, default="OneColor", max_length=10, null=True, blank=True,
                                   verbose_name="Available Color")
    click_num = models.IntegerField(default=0, verbose_name='Click Times')
    sold_num = models.IntegerField(default=0, verbose_name='Sold Quantity')
    fav_num = models.IntegerField(default=0, verbose_name='Total Favorite')
    goods_num = models.IntegerField(default=0, null=True, blank=True, verbose_name='Inventory')
    market_price = models.FloatField(default=0.0, verbose_name='Market Price')  # market price
    shop_price = models.FloatField(default=0.0, verbose_name='Price in Store')  # Promotion price in store
    goods_brief = models.TextField(max_length=100, default="", verbose_name='Product Brief Intro')
    goods_desc = UEditorField(verbose_name=u'Product Detail', imagePath='goods/images/', width=1000,
                              height=300, filePath='goods/files/', default='')
    ship_free = models.BooleanField(default=False, verbose_name='Free delivery')
    goods_front_image = models.ImageField(upload_to="goods/images/", null=True, blank=True, verbose_name='Home Page Product Image')
    # goods_front_image_url = models.CharField(max_length=300, default="", verbose_name='Home Page Product Image')
    is_new = models.BooleanField(default=False, verbose_name='New Arrival')
    is_hot = models.BooleanField(default=False, verbose_name='Popular Product')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = 'Product Detail'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class GoodsImage(models.Model):
    '''Item image roller'''
    goods = models.ForeignKey(Goods, verbose_name='Product Name', related_name='images')
    image = models.ImageField(upload_to="", verbose_name="Product Image", null=True, blank=True)
    image_url = models.CharField(max_length=300, null=True, blank=True, verbose_name="image url")
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = 'Item Image Roller'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name


class Banner(models.Model):
    '''Image Slider'''
    goods = models.ForeignKey(Goods, verbose_name="Product Name")
    image = models.ImageField(upload_to='banner', verbose_name='Roller Image')
    index = models.IntegerField(default=0, verbose_name='Rolling Sequence')
    add_time = models.DateTimeField(default=datetime.now, verbose_name='Add Time')

    class Meta:
        verbose_name = "Slider Image"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.goods.name
