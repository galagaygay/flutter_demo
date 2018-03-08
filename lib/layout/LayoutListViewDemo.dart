import 'package:flutter/material.dart';

///ListView即滚动列表控件，能将子控件组成可滚动的列表。
/// 当你需要排列的子控件超出容器大小，就需要用到滚动块。
class LayoutListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ListView滚动视图"),
      ), //AppBar
      body: new ListView(
        children: <Widget>[
          new Text(
            "\n为什么说Flutter是革命性的？",
            style: new TextStyle(
                fontFamily: "serif",
                fontSize: 25.0
            ), //TextStyle
          ), //Text
          new Text(
            "Flutter是什么？",
            style: new TextStyle(
                fontSize: 16.0,
                fontFamily: "serif"
            ), //TextStyle
          ), //Text
          new Text(
              '''
Flutter移动应用程序SDK是为开发人员提供一种创建快捷、美观的应用程序的新方式，从而摆脱过去那种千篇一律的app，尝试过Flutter的人都会真的爱上它；例如，这位开发者，这位，或者这位，或者由第三方编辑的一系列文章和视频。

与任何新系统一样，用户想知道Flutter有什么与众不同之处，“Flutter有什么新的或者令人兴奋的东西吗？”，这是一个合理的问题，本文将从技术的角度回答Flutter有什么东西让人兴奋，而且给出它为什么让人兴奋的原因。

但首先，先讲一小段历史。

移动开发的简史
移动开发是一个较新的领域，开发者们开始涉足移动开发时间尚不足十年，所以移动开发的工具仍然在发展当中，这并不奇怪。

OEM SDKs
苹果的iOS SDKs发布于2008年，谷歌的Android软件开发工具包发布于2009年，这两种工具包基于不同的编程语言，分别是Objective-C和Java。

通过这些SDK，你的应用可以与系统通信，以创建UI组件或访问系统相机。这些组件被渲染到手机屏幕，而相应的事件则被传回给组件。这个架构足够简单，但你仍然不得不为每个平台开发单独的App，因为这些系统组件都是不一样的，更不用提开发语言的不同了。

WebView
第一个跨平台的框架基于JavaScript 和 WebView，例如 Titanium和一系列相关的框架：PhoneGap, Apache Cordova, Ionic等，在苹果发布iOS之前，他们鼓励第三方开发者为iPhone构建网页应用程序，因此使用Web技术构建跨平台应用程序是顺理成章的一步。

你的应用程序可以创建HTML并将其显示在平台的WebViews上，请注意像JavaScript这样的语言很难直接与本地代码（例如服务）进行通信，因此他们会通过一个在JavaScript代码和原生代码的“桥梁”进行上下文切换，因为平台服务通常不会经常被调用，所以这并不会导致太大的性能问题。

响应式视图
像ReactJS或其他的响应式编程框架已经变得很流行了，主要是因为他们通过使用从响应式编程中借用的编程模式来简化Web视图的创建过程。2015年， React Native将响应式视图的许多优势带给了移动应用程序。

React Native是非常受欢迎的（这是它应得的），但是因为JavaScript访问了原生UI组件，所以它也必须经过这些“桥接器”，界面上的UI控件通常被频繁地访问（在动画、转化或者用户用手指“滑动”屏幕上的某些东西时，每秒被访问高达60次），因此这很可能会导致性能问题。

正如关于React Native的一篇文章所说：
'''
          ) //Text
        ], //<Widget>[]
      ), //ListView
    ); //Scaffold
  } //Widget build
}