import 'package:flutter/material.dart';
import 'package:flutter_demo/app.dart';
import 'package:flutter_demo/official/item.dart';

//Dart程序执行的主入口，就像java中的main函数一样
void main() {
  //初始化应用的内部路由
  final Map<String, WidgetBuilder> _kRoutes = <String, WidgetBuilder>{};
  for (MainItem item in kAllGalleryItems) {
    //先循环官方DEMO的路由
    _kRoutes[item.routeName] = (BuildContext context) {
      return item.buildRoute(context);
    };
  }
  //加入自己的DEMO路由
  for (MainItem item in kMyExampleItems) {
    //加入按照博客抄过来的DEMO的路由
    _kRoutes[item.routeName] = (BuildContext context) {
      return item.buildRoute(context);
    };
  }

  //runApp函数强制将根控件覆盖屏幕
  runApp(
      new MaterialApp(
        title: "Demo",
        //指定app启动进入的根节点视图
        home: new GalleryApp(),
        routes: _kRoutes, //<String, WidgetBuilder>
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
