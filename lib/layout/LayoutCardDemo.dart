import 'package:flutter/material.dart';

/// Card（卡片）
/// Card包含相关的信息块，可以由大多数任何控件组成，但经常与ListTile一起使用。
/// Card只有一个子控件，但它的子控件可以是支持多个子控件的列、行、列表、网格或其他控件。
/// 默认情况下，Card将其大小缩小为0像素。您可以使用SizedBox限制Card的大小。
///
/// 在Flutter中，Card具有略微圆角和阴影，给予3D效果。更改Card的elevation属性可以控制阴影效果。
/// 例如，将elevation设置为24，可以将Card从表面进一步提升，并使阴影变得更加分散。
/// 下面的布局是一张包含3个ListTile的卡片，并用SizedBox包装大小。分隔符分隔第一个和第二个ListTile。
///
class LayoutCardDemo extends StatefulWidget {
  static var routeName="/LayoutCardDemo";

  @override
  _LayoutCardDemoState createState() => new _LayoutCardDemoState();
}


class _LayoutCardDemoState extends State<LayoutCardDemo> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Card（卡片）"),
      ), //AppBar
      body: new SizedBox(
        height: 210.0,
        child: new Card(
          child: new Column(
            children: <Widget>[
              // ListTile是质感设计库中专门的行控件，可以轻松创建一行，
              // 其中最多包含3行文本和可选的前导和尾随图标。
              // ListTile最常用于Card或ListView，还可以在别的地方使用。
              new ListTile(
                leading: new Icon(Icons.compare),
                title: new Text("北京金色世纪商旅网络"),
                subtitle: new Text("地址：北京市大兴区经海三路109号"),
              ), //ListTile
              new Divider(),
              new ListTile(
                leading: new Icon(Icons.card_membership),
                title: new Text("1783****01"),
              ),//ListTile
              new ListTile(
                leading: new Icon(Icons.comment),
                title: new Text("jsj***@jsj.com"),
              ),//ListTile
            ], //<Widget>[]
          ), //Column
        ), //Card
      ), //SizeBox
    ); //Scaffold
  } //Widget build
}