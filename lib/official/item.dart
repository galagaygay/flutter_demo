import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/ani1/AnimationDemo.dart';
import 'package:flutter_demo/animation/ani2/TweenDemo.dart';
import 'package:flutter_demo/animation/ani2/TweenDemo2.dart';
import 'package:flutter_demo/animation/ani3/TweenDemo3.dart';
import 'package:flutter_demo/animation/ani4/TweenDemo4.dart';
import 'package:flutter_demo/animation/ani5/TweenDemo5.dart';
import 'package:flutter_demo/animation/ani6/TweenDemo6.dart';
import 'package:flutter_demo/container/ContainerDemo.dart';
import 'package:flutter_demo/counter/CounterPage1.dart';
import 'package:flutter_demo/counter/CounterPage2.dart';
import 'package:flutter_demo/draw/DecoratedBoxDemo.dart';
import 'package:flutter_demo/draw/OpacityDemo.dart';
import 'package:flutter_demo/file/LocalFileDemo.dart';
import 'package:flutter_demo/gesturedemo/GestureDetectorDemo.dart';
import 'package:flutter_demo/image/ImagePage.dart';
import 'package:flutter_demo/layout/LayoutAspectRatioDemo.dart';
import 'package:flutter_demo/layout/LayoutCardDemo.dart';
import 'package:flutter_demo/layout/LayoutCenterDemo.dart';
import 'package:flutter_demo/layout/LayoutColumnDemo.dart';
import 'package:flutter_demo/layout/LayoutContainerDemo.dart';
import 'package:flutter_demo/layout/LayoutGridViewDemo.dart';
import 'package:flutter_demo/layout/LayoutListViewDemo.dart';
import 'package:flutter_demo/layout/LayoutListViewDemo2.dart';
import 'package:flutter_demo/layout/LayoutRowDemo.dart';
import 'package:flutter_demo/layout/LayoutSizedBoxDemo.dart';
import 'package:flutter_demo/layout/LayoutStackDemo.dart';
import 'package:flutter_demo/material/ActionViewEcologyDemo.dart';
import 'package:flutter_demo/material/BottomNavigationBarDemo.dart';
import 'package:flutter_demo/material/PopupMenuButtonDemo.dart';
import 'package:flutter_demo/network/HttpJsonDemo.dart';
import 'package:flutter_demo/official/OfficialMainList.dart';
import 'package:flutter_demo/official/animation/HeroAnimation.dart';
import 'package:flutter_demo/official/animation/LogoApp.dart';
import 'package:flutter_demo/official/animation/LogoApp2.dart';
import 'package:flutter_demo/official/animation/LogoApp3.dart';
import 'package:flutter_demo/official/animation/LogoApp4.dart';
import 'package:flutter_demo/official/animation/RadialExpansionDemo.dart';
import 'package:flutter_demo/official/animation/StaggerDemo.dart';
import 'package:flutter_demo/official/samples/AnimatedListSample.dart';
import 'package:flutter_demo/shop/ShoppingListItem.dart';
import 'package:flutter_demo/shop/ShoppingListPage.dart';
import 'package:flutter_demo/text/TextFieldDemo.dart';
import 'package:flutter_demo/text/TextPage.dart';

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
  final WidgetBuilder buildRoute;

  //@required 代表必须要传入这个参数
  MainItem({
    @required this.title,
    @required this.subtitle,
    @required this.category,
    @required this.routeName,
    @required this.buildRoute
  })
      :assert(title != null),
        assert(subtitle != null),
        assert(category != null),
        assert(routeName != null),
        assert(buildRoute != null);

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
//              Timeline.instantSync(
//                  'Start Transition',
//                  arguments: <String, String>{
//                    "from": "/",
//                    "to": routeName
//                  } //arguments: <String, String>
//              ); //Timeline.instantSync
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
      title: "LogoApp",
      subtitle: "",
      category: "samples",
      routeName: LogoApp.routeName,
      buildRoute: (BuildContext context) => new LogoApp(),
    ),
    new MainItem(
      title: "LogoApp2",
      subtitle: "",
      category: "samples",
      routeName: LogoApp2.routeName,
      buildRoute: (BuildContext context) => new LogoApp2(),
    ),
    new MainItem(
      title: "LogoApp3",
      subtitle: "",
      category: "samples",
      routeName: LogoApp3.routeName,
      buildRoute: (BuildContext context) => new LogoApp3(),
    ),
    new MainItem(
      title: "LogoApp4",
      subtitle: "",
      category: "samples",
      routeName: LogoApp4.routeName,
      buildRoute: (BuildContext context) => new LogoApp4(),
    ),
    new MainItem(
      title: "HeroAnimation",
      subtitle: "英雄动画|共享动画。",
      category: "samples",
      routeName: HeroAnimation.routeName,
      buildRoute: (BuildContext context) => new HeroAnimation(),
    ),
    new MainItem(
      title: "RadialExpansionDemo",
      subtitle: "Radial Transition Demo（径向过渡演示）。",
      category: "samples",
      routeName: RadialExpansionDemo.routeName,
      buildRoute: (BuildContext context) => new RadialExpansionDemo(),
    ),
    new MainItem(
      title: "AppBarBottom",
      subtitle: "Staggered Animation（交错动画）。",
      category: "samples",
      routeName: StaggerDemo.routeName,
      buildRoute: (BuildContext context) => new StaggerDemo(),
    ),
    new MainItem(
      title: "TextFieldDemo",
      subtitle: "文本输入控件。",
      category: "samples",
      routeName: TextFieldDemo.routeName,
      buildRoute: (BuildContext context) => new TextFieldDemo(),
    ),
    new MainItem(
      title: "AppBarBottom",
      subtitle: "任何具有PreferredSize的小部件都可以出现在AppBar的底部。",
      category: "samples",
      routeName: AnimatedListSample.routeName,
      buildRoute: (BuildContext context) => new AnimatedListSample(),
    ),
  ];
  return _samplesData;
}

final List<MainItem> kAllGalleryItems = _buildSamples();


///--------------------------------------------------------------------------------------------


///构建测试数据
List<MainItem> _buildMyExample() {
  //列表使用的数据
  List<MainItem> _samplesData = <MainItem>[
    new MainItem(
      title: "OfficialMainList",
      subtitle: "这里面展示的是Google官方网站的Demo",
      category: "official",
      routeName: OfficialMainList.routeName,
      buildRoute: (BuildContext context) => new OfficialMainList(),
    ),
    new MainItem(
      title: "CounterPage1",
      subtitle: "计数器简单实现。",
      category: "samples",
      routeName: CounterPage1.routeName,
      buildRoute: (BuildContext context) => new CounterPage1(),
    ),
    new MainItem(
      title: "CounterPage2",
      subtitle: "计数器_子视图与主体分离。",
      category: "samples",
      routeName: CounterPage2.routeName,
      buildRoute: (BuildContext context) => new CounterPage2(),
    ),
    new MainItem(
      title: "ContainerDemo",
      subtitle: "这是一个容器。",
      category: "samples",
      routeName: ContainerDemo.routeName,
      buildRoute: (BuildContext context) => new ContainerDemo(),
    ),
    new MainItem(
      title: "TextPage",
      subtitle: "Text控件使用展示。",
      category: "samples",
      routeName: TextPage.routeName,
      buildRoute: (BuildContext context) => new TextPage(),
    ),
    new MainItem(
      title: "ImagePage",
      subtitle: "Image加载图片。",
      category: "samples",
      routeName: ImagePage.routeName,
      buildRoute: (BuildContext context) => new ImagePage(),
    ),
    new MainItem(
      title: "LayoutRowDemo",
      subtitle: "Row水平布局。",
      category: "samples",
      routeName: LayoutRowDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutRowDemo(),
    ),
    new MainItem(
      title: "LayoutColumnDemo",
      subtitle: "Column垂直布局。",
      category: "samples",
      routeName: LayoutColumnDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutColumnDemo(),
    ),
    new MainItem(
      title: "LayoutStackDemo",
      subtitle: "Stack层叠布局。",
      category: "samples",
      routeName: LayoutStackDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutStackDemo(),
    ),
    new MainItem(
      title: "LayoutListViewDemo",
      subtitle: "ListView滚动视图。",
      category: "samples",
      routeName: LayoutListViewDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutListViewDemo(),
    ),
    new MainItem(
      title: "LayoutCenterDemo",
      subtitle: "Center中心定位。",
      category: "samples",
      routeName: LayoutCenterDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutCenterDemo(),
    ),
    new MainItem(
      title: "LayoutSizeBoxDemo",
      subtitle: "SizedBox(强制大小)。",
      category: "samples",
      routeName: LayoutSizeBoxDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutSizeBoxDemo(),
    ),
    new MainItem(
      title: "LayoutAspectRatioDemo",
      subtitle: "AspectRatio强制比例。",
      category: "samples",
      routeName: LayoutAspectRatioDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutAspectRatioDemo(),
    ),
    new MainItem(
      title: "DecoratedBoxDemo",
      subtitle: "DecoratedBox。",
      category: "samples",
      routeName: DecoratedBoxDemo.routeName,
      buildRoute: (BuildContext context) => new DecoratedBoxDemo(),
    ),
    new MainItem(
      title: "OpacityDemo",
      subtitle: "Opacity(不透明)。",
      category: "samples",
      routeName: OpacityDemo.routeName,
      buildRoute: (BuildContext context) => new OpacityDemo(),
    ),
    new MainItem(
      title: "PopupMenuButtonDemo",
      subtitle: "PopupMenuButton。",
      category: "samples",
      routeName: PopupMenuButtonDemo.routeName,
      buildRoute: (BuildContext context) => new PopupMenuButtonDemo(),
    ),
    new MainItem(
      title: "BottomNavigationBarDemo",
      subtitle: "BottomNavigationBar底部导航控件。",
      category: "samples",
      routeName: BottomNavigationBarDemo.routeName,
      buildRoute: (BuildContext context) => new BottomNavigationBarDemo(),
    ),
    new MainItem(
      title: "HttpJsonDemo",
      subtitle: "网络异步加载资源。",
      category: "samples",
      routeName: HttpJsonDemo.routeName,
      buildRoute: (BuildContext context) => new HttpJsonDemo(),
    ),
    new MainItem(
      title: "LocalFileDemo",
      subtitle: "异步加载本地Json资源。",
      category: "samples",
      routeName: LocalFileDemo.routeName,
      buildRoute: (BuildContext context) => new LocalFileDemo(),
    ),
    new MainItem(
      title: "ActionViewEcologyDemo",
      subtitle: "进度条控件。",
      category: "samples",
      routeName: ActionViewEcologyDemo.routeName,
      buildRoute: (BuildContext context) =>
      new ActionViewEcologyDemo(
        maximumEmergy: 100,
        maximumHunger: 100,
        maximumMood: 100,
        currentEmergy: 50,
        currentHunger: 23,
        currentMood: 44,
      ),
    ),
    new MainItem(
      title: "LayoutContainerDemo",
      subtitle: "Container（容器）。",
      category: "samples",
      routeName: LayoutContainerDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutContainerDemo(),
    ),
    new MainItem(
      title: "LayoutGridViewDemo",
      subtitle: "GridView（网格视图）。",
      category: "samples",
      routeName: LayoutGridViewDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutGridViewDemo(),
    ),
    new MainItem(
      title: "ShoppingListPage",
      subtitle: "GridView（网格视图）。",
      category: "samples",
      routeName: ShoppingListPage.routeName,
      buildRoute: (BuildContext context) =>
      new ShoppingListPage(products: _kProducts,),
    ),
    new MainItem(
      title: "LayoutListViewDemo2",
      subtitle: "ListView（列表视图）。",
      category: "samples",
      routeName: LayoutListViewDemo2.routeName,
      buildRoute: (BuildContext context) => new LayoutListViewDemo2(),
    ),
    new MainItem(
      title: "LayoutCardDemo",
      subtitle: "Card（卡片）。",
      category: "samples",
      routeName: LayoutCardDemo.routeName,
      buildRoute: (BuildContext context) => new LayoutCardDemo(),
    ),
    new MainItem(
      title: "GestureDetectorDemo",
      subtitle: "点击、拖动和其他手势监听。",
      category: "samples",
      routeName: GestureDetectorDemo.routeName,
      buildRoute: (BuildContext context) => new GestureDetectorDemo(),
    ),
    new MainItem(
      title: "AnimationDemo",
      subtitle: "Flutter进阶—解析动画。",
      category: "samples",
      routeName: AnimationDemo.routeName,
      buildRoute: (BuildContext context) => new AnimationDemo(),
    ),
    new MainItem(
      title: "TweenDemo",
      subtitle: "Tween动画。",
      category: "samples",
      routeName: TweenDemo.routeName,
      buildRoute: (BuildContext context) => new TweenDemo(),
    ),
    new MainItem(
      title: "TweenDemo2",
      subtitle: "Tween动画。",
      category: "samples",
      routeName: TweenDemo2.routeName,
      buildRoute: (BuildContext context) => new TweenDemo2(),
    ),
    new MainItem(
      title: "TweenDemo3",
      subtitle: "Tween动画。",
      category: "samples",
      routeName: TweenDemo3.routeName,
      buildRoute: (BuildContext context) => new TweenDemo3(),
    ),
    new MainItem(
      title: "TweenDemo4",
      subtitle: "Tween动画。",
      category: "samples",
      routeName: TweenDemo4.routeName,
      buildRoute: (BuildContext context) => new TweenDemo4(),
    ),
    new MainItem(
      title: "TweenDemo5",
      subtitle: "Tween动画。",
      category: "samples",
      routeName: TweenDemo5.routeName,
      buildRoute: (BuildContext context) => new TweenDemo5(),
    ),
    new MainItem(
      title: "TweenDemo6",
      subtitle: "Tween动画。",
      category: "samples",
      routeName: TweenDemo6.routeName,
      buildRoute: (BuildContext context) => new TweenDemo6(),
    ),
  ];
  return _samplesData;
}

final List<MainItem> kMyExampleItems = _buildMyExample();


/// 创建测试数据
final List<Product> _kProducts = <Product>[
  new Product(id: 0, name: "老干妈"),
  new Product(id: 1, name: "康师傅"),
  new Product(id: 2, name: "王致和臭豆腐"),
  new Product(id: 3, name: "手擀面"),
  new Product(id: 4, name: "大饼"),
  new Product(id: 5, name: "红酒"),
  new Product(id: 6, name: "白酒"),
  new Product(id: 7, name: "花露水"),
  new Product(id: 8, name: "TT"),
  new Product(id: 9, name: "擀面杖"),
  new Product(id: 10, name: "海底捞"),
  new Product(id: 11, name: "瘦肉"),
  new Product(id: 12, name: "香蕉"),
];

