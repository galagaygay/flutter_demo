import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
//引入网络层


///通过网络加载JSON文件的实例
class HttpJsonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("网络与本地异步加载资源"),
      ), //AppBar
      body: new Center(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print("加载网络");
                _networkLoading();
              }, //onPressed: ()
              child: new Text("加载网络信息"),
            ) //RaisedButton
          ], //<Widget>[]
        ), //Column
      ), //Center
    ); //Scaffold
  } //Widget build
}

void _networkLoading() async {
  //https://domokit.github.io/examples/stocks/data/stock_data_2.json
  var httpClient = new HttpClient();
  //创建Http请求Uri
  var uri = new Uri.https(
    //域名
      'domokit.github.io',
      //要访问的具体的服务
      '/examples/stocks/data/stock_data_2.json',
      //get请求参数
      {}
  );
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();

  // JsonDecoder类解析JSON字符串并构建相应的对象
  JsonDecoder decoder = new JsonDecoder();
  // 将给定的JSON字符串输入转换为其对应的对象
  List<List<String>> json = decoder.convert(responseBody);
  // 输出给定的JSON数据
  print(json);
}