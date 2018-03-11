import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/AnimationDemo.dart';
import 'package:flutter_demo/animation/TweenDemo.dart';
import 'package:flutter_demo/animation/TweenDemo2.dart';
import 'package:flutter_demo/animation/ani3/TweenDemo3.dart';
import 'package:flutter_demo/animation/ani4/TweenDemo4.dart';
import 'package:flutter_demo/app.dart';
import 'package:flutter_demo/container/ContainerDemo.dart';
import 'package:flutter_demo/counter/CounterPage1.dart';
import 'package:flutter_demo/counter/CounterPage2.dart';
import 'package:flutter_demo/draw/DecoratedBoxDemo.dart';
import 'package:flutter_demo/draw/OpacityDemo.dart';
import 'package:flutter_demo/file/LocalFileDemo.dart';
import 'package:flutter_demo/gesturedemo/GestureDetectorDemo.dart';
import 'package:flutter_demo/image/ImagePage.dart';
import 'package:flutter_demo/layout/LayoutAlignDemo.dart';
import 'package:flutter_demo/layout/LayoutAspectRatioDemo.dart';
import 'package:flutter_demo/layout/LayoutCardDemo.dart';
import 'package:flutter_demo/layout/LayoutCenterDemo.dart';
import 'package:flutter_demo/layout/LayoutColumnDemo.dart';
import 'package:flutter_demo/layout/LayoutContainerDemo.dart';
import 'package:flutter_demo/layout/LayoutGridViewDemo.dart';
import 'package:flutter_demo/layout/LayoutListViewDemo.dart';
import 'package:flutter_demo/layout/LayoutListViewDemo2.dart';
import 'package:flutter_demo/layout/LayoutPaddingDemo.dart';
import 'package:flutter_demo/layout/LayoutRowDemo.dart';
import 'package:flutter_demo/layout/LayoutSizedBoxDemo.dart';
import 'package:flutter_demo/layout/LayoutStackDemo.dart';
import 'package:flutter_demo/material/ActionViewEcologyDemo.dart';
import 'package:flutter_demo/material/BottomNavigationBarDemo.dart';
import 'package:flutter_demo/material/PopupMenuButtonDemo.dart';
import 'package:flutter_demo/network/HttpJsonDemo.dart';
import 'package:flutter_demo/shop/ShoppingListItem.dart';
import 'package:flutter_demo/shop/ShoppingListPage.dart';
import 'package:flutter_demo/text/TextPage.dart';

//Dart程序执行的主入口，就像java中的main函数一样
void main() {
  //runApp函数强制将根控件覆盖屏幕
  runApp(
      new MaterialApp(
        title: "Demo",
        //指定app启动进入的根节点视图
        home: new GalleryApp(),
        routes: <String, WidgetBuilder>{
          // 先声明要跳转的新页面,title是要传递的参数,
          // '/second_page'是给这个页面取个名字，后面会用到
          '/shop_page':
              (BuildContext context) =>
          new ShoppingListPage(products: _kProducts,),
          '/counter_page1':
              (BuildContext context) => new CounterPage1(),
          '/counter_page2':
              (BuildContext context) => new CounterPage2(),
          '/contater_page':
              (BuildContext context) => new ContainerDemo(),
          '/text_widget_page':
              (BuildContext context) => new TextPage(),
          '/image_widget_page':
              (BuildContext context) => new ImagePage(),
          '/layout_row_page':
              (BuildContext context) => new LayoutRowDemo(),
          '/layout_column_page':
              (BuildContext context) => new LayoutColumnDemo(),
          '/layout_stack_page':
              (BuildContext context) => new LayoutStackDemo(),
          '/layout_list_view_page':
              (BuildContext context) => new LayoutListViewDemo(),
          '/layout_center_page':
              (BuildContext context) => new LayoutCenterDemo(),
          '/layout_align_page':
              (BuildContext context) => new LayoutAlignDemo(),
          '/layout_padding_page':
              (BuildContext context) => new LayoutPaddingDemo(),
          '/layout_size_page':
              (BuildContext context) => new LayoutSizeBoxDemo(),
          '/layout_aspectratio_page':
              (BuildContext context) => new LayoutAspectRatioDemo(),
          '/layout_decorated_box_page':
              (BuildContext context) => new DecoratedBoxDemo(),
          '/layout_Opacity_page':
              (BuildContext context) => new OpacityDemo(),
          '/MenuButton_page':
              (BuildContext context) => new PopupMenuButtonDemo(),
          '/BottomNavigationBar':
              (BuildContext context) => new BottomNavigationBarDemo(),
          '/HttpJsonDemo':
              (BuildContext context) => new HttpJsonDemo(),
          '/LocalFileDemo':
              (BuildContext context) => new LocalFileDemo(),
          '/ActionViewEcologyDemo':
              (BuildContext context) =>
          new ActionViewEcologyDemo(
            maximumEmergy: 100,
            maximumHunger: 100,
            maximumMood: 100,
            currentEmergy: 50,
            currentHunger: 23,
            currentMood: 44,
          ),
          '/LayoutContainerDemo':
              (BuildContext context) => new LayoutContainerDemo(),
          '/LayoutGridViewDemo':
              (BuildContext context) => new LayoutGridViewDemo(),
          '/LayoutListViewDemo2':
              (BuildContext context) => new LayoutListViewDemo2(),
          '/LayoutCardDemo':
              (BuildContext context) => new LayoutCardDemo(),
          '/GestureDetectorDemo':
              (BuildContext context) => new GestureDetectorDemo(),
          '/AnimationDemo':
              (BuildContext context) => new AnimationDemo(),
          '/TweenDemo':
              (BuildContext context) => new TweenDemo(),
          '/TweenDemo2':
              (BuildContext context) => new TweenDemo2(),
          '/TweenDemo3':
              (BuildContext context) => new TweenDemo3(),
          '/TweenDemo4':
              (BuildContext context) => new TweenDemo4(),
        }, //<String, WidgetBuilder>
        //修改主题数据
        theme: new ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            //设置平台
            platform: TargetPlatform.iOS
        ), //ThemeData
      ) //MaterialApp
  ); //runApp
}

/// 创建测试数据
final List<Product> _kProducts = <Product>[
  new Product(id: 0, name: "老干妈"),
  new Product(id: 1, name: "康师傅"),
  new Product(id: 2, name: "王致和臭豆腐"),
  new Product(id: 3, name: "手擀面"),
  new Product(id: 4, name: "大饼"),
  new Product(id: 5, name: "红酒"),
  new Product(id: 6, name: "白酒"),
  new Product(id: 7, name: "花露水"),
  new Product(id: 8, name: "TT"),
  new Product(id: 9, name: "擀面杖"),
  new Product(id: 10, name: "海底捞"),
  new Product(id: 11, name: "瘦肉"),
  new Product(id: 12, name: "香蕉"),
];

