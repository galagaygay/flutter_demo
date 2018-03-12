import 'package:flutter/material.dart';

///ListView（列表视图）
///ListView是一个类列表的控件，当其内容对于其渲染框太长时，它会自动提供滚动。
///下面的布局使用ListTiles的业务列表，用分隔线将剧院与餐厅分开。
class LayoutListViewDemo2 extends StatefulWidget {
  static var routeName="/LayoutListViewDemo2";

  @override
  _LayoutListViewDemo2 createState() => new _LayoutListViewDemo2();
}

class _LayoutListViewDemo2 extends State<LayoutListViewDemo2> {

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildListData(int count) {
      return new List<Widget>.generate(
          count,
              (int index) =>
          new ListTile(
            leading: new Icon(
              Icons.local_activity,
              color: Colors.blue,
            ),
            title: new Text(
              '深圳万达海雅广场店',
              style: new TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0
              ),
            ), //Text
            subtitle: new Text(
              "深圳市宝安区建安一路海雅缤纷城4楼",
            ), //Text
          ) // ListTile
      );
    }


    //创建列表使用的数据
    List<Widget> _listDate = <Widget>[
    ]; //<Widget>[]

    Iterator<Widget> listData1 = _buildListData(3).iterator;

    while (listData1.moveNext()) {
      _listDate.add(listData1.current);
    }

    _listDate.add(new Divider(
      height: 30.0,
      indent: 9.0,
      color: Colors.orange,
    ));

    Iterator<Widget> listData2 = _buildListData(5).iterator;

    while (listData2.moveNext()) {
      _listDate.add(listData2.current);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView（列表视图）"),
      ), //AppBar
      body: new Container(
        child: new ListView(
          children: _listDate,
        ),
      ), //Container
    ); //Scaffold
  } //Widget build
}