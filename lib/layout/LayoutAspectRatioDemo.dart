import 'package:flutter/material.dart';

///AspectRatio控件能强制子小部件的宽度和高度具有给定的宽高比，以宽度与高度的比例表示。
class LayoutAspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('AspectRatio强制比例'),
      ),
      body: new AspectRatio(
        aspectRatio: 3.0 / 2.0,
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.lightBlueAccent[100],
          ),
        ),
      ),
    );
  }
}