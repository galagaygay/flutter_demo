import 'package:flutter/material.dart';

///商品实体
class Product {
  //商品ID
  final int id;

  //商品名称
  final String name;

  const Product({
    this.id,
    this.name,
  });
}

/// 类型定义(Typedefs)
/// 在Dart 语言中，函数也是一个对象，和字符串或数字一样。
typedef void CartChangedCallback(Product product, bool inCart);

/// 商品列表视图中的每一行的视图
/// ShoppingListItem控件遵循无状态控件的通用模式
/// 当父控件接收到onCartChanged回调，父控件会更新其内部状态，这将触发父控件重建并使用新的inCart值创建ShoppingListItem的新实例。
/// 尽管父控件在重建时创建了ShoppingListItem的新实例，但该操作很节省，因为框架会将新构建的控件与之前构建的控件时进行比较，并将有差异的部分应用于底层渲染对象。
class ShoppingListItem extends StatelessWidget {
  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  // ShoppingListItem控件遵循无状态控件的通用模式，将在构造函数中接收到的值存储在final成员变量中，然后在build函数执行时使用。
  // 例如布尔值inCart在两个视觉效果之间切换：一个使用当前主题的颜色，另一个使用灰色。
  ShoppingListItem({ Product product, this.inCart, this.onCartChanged,})
      :product=product,
        super(key: new ObjectKey(product));

  //定义条目的背景色，如果已经存在购物车换成黑色的，如果没在，使用应用的主色
  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 :
    //获取系统的主色
    Theme
        .of(context)
        .primaryColor;
  }

  // 获取文字样式，如果已经存在购物车将文字使用删除线修饰
  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return new TextStyle(
        color: Colors.black54,
        //删除线效果
        decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    // 创建列表的每一行的控件填充
    return new ListTile(
      // 设置点击事件
      onTap: () {
        // 当用户点击列表项时，控件不会直接修改inCart的值，但是控件从父控件接收onCartChanged函数。
        // 此模式允许你在控件较高的层次结构中存储状态，这样使状态的持续时间更长。
        // 在极端情况下，存储在runApp的控件状态在应用程序的生命周期内保持不变。
        onCartChanged(product, !inCart);
      },
      // 创建一个圆形的容器
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        // 取出商品名称的第一个字符进行内容组件的设置
        child: new Text(product.name[0]),
      ),
      // 创建标题
      title: new Text(product.name, style: _getTextStyle(context),),
    );
  }
}
