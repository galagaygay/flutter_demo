import 'package:flutter/material.dart';

///GridView（网格视图）
///使用GridView将控件作为二维列表放置。 GridView提供了两个预制列表，或者您可以构建自己的自定义网格。
///当GridView检测到其内容太长，无法适应渲染框时，它会自动滚动。
///
class LayoutGridViewDemo extends StatefulWidget {
  static var routeName="/LayoutGridViewDemo";

  @override
  _LayoutGridViewDemoState createState() => new _LayoutGridViewDemoState();

}

class _LayoutGridViewDemoState extends State<LayoutGridViewDemo> {

  //创建网格列表使用的数据
  List<Container> _buildGridTitleList(int count) {
    //创建一个指定长度的List集合，泛型指定为Container类型
    return new List<Container>.generate(
        count,
            (int index) =>
        new Container(
          child: new Image.asset("images/1405166072230_middle.jpg"),
        ) //Container
    ); //new
  }

  //构建GridView视图
  Widget buildGrid() {
    //创建一个可滚动的二维小部件阵列，每个小部件都有最大横轴范围。
    return new GridView.extent(
      //设置单个子元素的宽高，最大150像素宽的图块
      maxCrossAxisExtent:150.0,
      //内边距
      padding: const EdgeInsets.all(5.0),
      //主轴间距
      mainAxisSpacing: 5.0,
      //跨轴间距
      crossAxisSpacing: 5.0,
      //设置列表内数据
      children: _buildGridTitleList(99), //children
    ); //GridView.extent
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GridView（网格视图）"),
      ),
      body: new Container(
        child: buildGrid(),
      ),
    ); //Scaffold
  } //Widget build
}