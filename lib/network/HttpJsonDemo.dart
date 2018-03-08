import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
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
                _networkLoading();
              },//onPressed: ()
              child: new Text("加载网络信息"),
            ) //RaisedButton
          ], //<Widget>[]
        ), //Column
      ), //Center
    ); //Scaffold
  } //Widget build
}

void _networkLoading() {
  // 将给定标头的HTTP GET请求发送到给定的URL，并注册回调，参数为HTTP响应
  http.get('https://domokit.github.io/examples/stocks/data/stock_data_2.json').then((http.Response response) {
    // 响应的主体作为字符串返回
    String netdata = response.body;
    // JsonDecoder类解析JSON字符串并构建相应的对象
    JsonDecoder decoder = new JsonDecoder();
    // 将给定的JSON字符串输入转换为其对应的对象
    List<List<String>> json = decoder.convert(netdata);
    // 输出给定的JSON数据
    print(json[0][1]);
  });
}