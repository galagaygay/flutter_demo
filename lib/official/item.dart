import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/official/samples/AnimatedListSample.dart';
import 'package:flutter_demo/official/samples/AppBarBottomSample.dart';

///封装列表使用的列表视图
class MainItem extends StatelessWidget {

  //标题
  final String title;

  //副标题
  final String subtitle;

  //分组类别
  final String category;

  //路由跳转的名字
  final String routeName;

  //路由对应的页面实例
  final WidgetBuilder builderRoute;

  //@required 代表必须要传入这个参数
  MainItem({
    @required this.title,
    @required this.subtitle,
    @required this.category,
    @required this.routeName,
    @required this.builderRoute
  })
      :assert(title != null),
        assert(subtitle != null),
        assert(category != null),
        assert(routeName != null),
        assert(builderRoute != null);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 10.0
        ), //padding
        child: new ListTile(
          title: new Text(title),
          subtitle: new Text(subtitle),
          onTap: () {
            if (routeName != null) {
              //这个是开发用来用来记录的
              Timeline.instantSync(
                  'Start Transition',
                  arguments: <String, String>{
                    "from": "/",
                    "to": routeName
                  } //arguments: <String, String>
              ); //Timeline.instantSync
              //进行路由跳转
              Navigator.pushNamed(context, routeName);
            }
          }, //onTap
        ), //ListTile,
      ), //Container
    ); //Card
  } //Widget build
}


///构建测试数据
List<MainItem> _buildSamples() {
  //列表使用的数据
  List<MainItem> _samplesData = <MainItem>[
    new MainItem(
      title: "AnimatedList",
      subtitle: "AnimatedList，显示与特定于应用程序的ListModel保持同步的卡片列表。当项目被添加到模型或从模型中删除时，相应的卡片在视图内或视图外动画。",
      category: "samples",
      routeName: AnimatedListSample.routeName,
      builderRoute: (BuildContext context) => new AnimatedListSample(),
    ),
    new MainItem(
      title: "AppBarBottom",
      subtitle: "任何具有PreferredSize的小部件都可以出现在AppBar的底部。",
      category: "samples",
      routeName: AppBarBottomSample.routeName,
      builderRoute: (BuildContext context) => new AppBarBottomSample(),
    )
  ];
  return _samplesData;
}

final List<MainItem> kAllGalleryItems = _buildSamples();