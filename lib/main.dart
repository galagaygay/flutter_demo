import 'package:flutter/material.dart';
import 'package:flutter_demo/shop/app.dart';

//Dart程序执行的主入口，就像java中的main函数一样
void main() {
  //runApp函数强制将根控件覆盖屏幕
  runApp(
      new MaterialApp(
        title: "Demo",
        //指定app启动进入的根节点视图
        home: new GalleryApp(),
      )
  );
}
