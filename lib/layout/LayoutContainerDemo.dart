import 'package:flutter/material.dart';

///
///Container（容器）使用
class LayoutContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
            "Container（容器）"
        ), //Text
      ), //AppBar
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    child: new Image.asset("images/1405166051589_middle.jpg"),
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          width: 15.0,
                          color: Colors.pink
                      ), //border
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0)
                      ), //borderRadius
                    ), //BoxDecoration
                    margin: const EdgeInsets.all(5.0),
                  ), //Container
                ), //Expanded
                new Expanded(
                  child: new Container(
                    child: new Image.asset("images/1405166072230_middle.jpg"),
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          width: 15.0,
                          color: Colors.black38
                      ), //border
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0)
                      ), //borderRadius
                    ), //BoxDecoration
                    margin: const EdgeInsets.all(5.0),
                  ), //Container
                ), //Expanded
              ], //<Widget>[]
            ), //Row
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Container(
                    child: new Image.asset("images/1405166057580_middle.jpg"),
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          width: 15.0,
                          color: Colors.yellow
                      ), //border
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0)
                      ), //borderRadius
                    ), //BoxDecoration
                    margin: const EdgeInsets.all(5.0),
                  ), //Container
                ), //Expanded
                new Expanded(
                  child: new Container(
                    child: new Image.asset("images/1405166061660_middle.jpg"),
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          width: 15.0,
                          color: Colors.blue
                      ), //border
                      borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0)
                      ), //borderRadius
                    ), //BoxDecoration
                    margin: const EdgeInsets.all(5.0),
                  ), //Container
                ), //Expanded
              ], //<Widget>[]
            ), //Row
          ], //<Widget>[]
        ), //Column
      ), //Container
    ); // Scaffold
  } // Widget build
}