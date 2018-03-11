import 'package:flutter/material.dart';
import 'package:flutter_demo/official/item.dart';

///这里集成的是官方提供的DEMO集合
///https://flutter.io/catalog/samples/
///
class OfficialMainList extends StatefulWidget {
  @override
  _OfficialMainListState createState() => new _OfficialMainListState();
}

class _OfficialMainListState extends State<OfficialMainList> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("官网Samples"),
      ), //AppBar
      body: new Container(
        child: new ListView(
          children: kAllGalleryItems,
        ), //ListView
      ), //Container
    ); //Scaffold
  } //Widget build
}
