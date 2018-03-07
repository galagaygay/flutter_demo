import 'package:flutter/material.dart';

//定义主的脚手架页面
class GalleryApp extends StatefulWidget {
  GalleryAppState createState() => new GalleryAppState();
}

//StatefulWidget[有状态控件]的逻辑和内部状态
class GalleryAppState extends State<GalleryApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //第一个位置放置了自定义的AppBar
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(
            Icons.menu,
            color: Colors.white,
          ),
          tooltip: "导航菜单",
          onPressed: null,
        ),
        title: new Text("主页面"),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(
                Icons.search,
                color: Colors.white,
              ),
              tooltip: "搜索",
              onPressed: () {
                print("点击了搜索按钮");
              }
          )
        ],
      ),
      //Column垂直布局
      body: new Column(
        children: <Widget>[
          //定义内容展示区域
          //Expanded占满剩余空间的内容区域
          new Expanded(
            //创建了中心填充文本控件
              child: new Center(
                child: new GestureDetector(
                  onTap: (){
                    print("点击了文本控件");
                  },
                  child: new Text("你好"),
                ),
              )
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          tooltip: "悬浮按钮",
          child: new IconButton(
              icon: new Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: null
          ),
          onPressed: () {
            print("悬浮按钮被点击了");
          }
      ),
    );
  }
}
