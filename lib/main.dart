import 'package:flutter/material.dart';
import 'package:flutter_demo/app.dart';
import 'package:flutter_demo/shop/ShoppingListApp.dart';
import 'package:flutter_demo/shop/ShoppingListItem.dart';

//Dart程序执行的主入口，就像java中的main函数一样
void main() {
  //runApp函数强制将根控件覆盖屏幕
  runApp(
      new MaterialApp(
        title: "Demo",
        //指定app启动进入的根节点视图
        home: new ShoppingList(products: _kProducts,),
      )
  );
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
  new Product(id: 13, name: "香蕉"),
  new Product(id: 14, name: "香蕉"),
  new Product(id: 15, name: "香蕉"),
  new Product(id: 16, name: "香蕉"),
  new Product(id: 17, name: "香蕉"),
  new Product(id: 18, name: "香蕉"),
  new Product(id: 19, name: "香蕉"),
  new Product(id: 20, name: "香蕉"),
  new Product(id: 21, name: "香蕉"),
  new Product(id: 22, name: "香蕉"),
  new Product(id: 23, name: "香蕉"),
  new Product(id: 24, name: "香蕉"),
];