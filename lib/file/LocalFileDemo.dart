import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///通过异步加载本地Json资源，需要先在pubspec.yaml文件添加资源文件，然后再通过异步加载资源文件，以下为实例
class LocalFileDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("异步加载本地Json资源"),
      ), //AppBar
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print("开始加载本地config.json");
                _loadJsonAsset();
                print("测试异步执行效果………………");
              },
              child: new Text(
                  "加载本地config.json文件"
              ), //Text
            ) //RaisedButton
          ], //<Widget>[]
        ), //Column
      ), //Center
    ); //Scaffold
  } //Widget build
}

//加载资源文件
Future<String> loadAsset() {
  return rootBundle.loadString('assets/config.json');
}

void _loadJsonAsset() {
  loadAsset().then(
          (value) {
        List<List<String>> json = JSON.decode(value);
        print(
            "加载config.json成功=》" +
                json.toString()
        );
      }
  ); //loadAsset().then
}