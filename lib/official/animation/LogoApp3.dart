import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

///
class LogoApp3 extends StatefulWidget {
  static var routeName="/LogoApp3";

  _LogoAppState3 createState() => new _LogoAppState3();
}

class _LogoAppState3 extends State<LogoApp3> with TickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    ); //AnimationController
    final CurvedAnimation curve = new CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn
    ); //CurvedAnimation
    animation = new Tween(
        begin: 0.0,
        end: 300.0
    ).animate(curve);

    controller.forward();
  } //initState

  @override
  Widget build(BuildContext context) {
    return new GrowTransition(
        child: new LogoWidget(),
        animation: animation
    ); //GrowTransition
  } //Widget build

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  } //dispose
}

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new FlutterLogo(),
    );
  }
}

///GrowTransition小部件本身是无状态的，并拥有定义过渡动画所需的最终变量集合
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                height: animation.value,
                width: animation.value,
                child: child
            ); //Container
          }, //builder
          child: child
      ), //AnimatedBuilder
    ); //Center
  } //Widget build
}