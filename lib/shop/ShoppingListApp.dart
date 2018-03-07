import 'package:flutter/material.dart';

import 'ShoppingListItem.dart';

/// 类ShoppingList继承了StatefulWidget，这意味着这个控件存储可变状态，当ShoppingList首次插入到树中，
/// 框架调用createState函数在树中相关联的位置创建一个新的_ShoppingListState实例（注意：通常命名中带有下划线的State子类，说明它们是私有类）。
/// 当该控件的父控件重建时，父控件会创建一个新的ShoppingList实例，
/// 但框架将重用已经在树上的_ShoppingListState实例，而不会再次调用createState函数。

/// 商品列表中列表视图
class ShoppingList extends StatefulWidget {

  //商品列表数据集合
  final List<Product> products;

  ShoppingList({Key key, this.products}) :super(key: key);

  @override
  _ShoppingListState createState() => new _ShoppingListState();
}

// 有状态的视图控件的状态监听
class _ShoppingListState extends State<ShoppingList> {

  // 购物车临时存储
  Set<Product> _shoppingCart = new Set<Product>();

  //处理条目点击事件，对购物车中的商品进行添加删除操作
  void _handleCartChanged(Product product, bool inCat) {
    //通知framework层该对象的内部状态已经改变，需要进行刷新了
    setState(
            () {
          if (inCat) {
            _shoppingCart.add(product);
          } else {
            _shoppingCart.remove(product);
          }
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("购物清单"),),
      body: new ListView(
        // 创建ListView中的列表项，widget指向的是当前的ShoppingList
        children: widget.products.map(
                (Product product) {
              // 创建单个的列表项
              return new ShoppingListItem(
                product: product,
                //设置当前的商品手机否
                inCart: _shoppingCart.contains(product),
                //设置列表条目的点击事件回调
                onCartChanged: _handleCartChanged,
              );
            }
        ).toList(),
      ),
    );
  }
}

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
  new Product(id: 13, name: "香蕉"),
  new Product(id: 14, name: "香蕉"),
  new Product(id: 15, name: "香蕉"),
  new Product(id: 16, name: "香蕉"),
  new Product(id: 17, name: "香蕉"),
  new Product(id: 18, name: "香蕉"),
  new Product(id: 19, name: "香蕉"),
  new Product(id: 20, name: "香蕉"),
  new Product(id: 21, name: "香蕉"),
  new Product(id: 22, name: "香蕉"),
  new Product(id: 23, name: "香蕉"),
  new Product(id: 24, name: "香蕉"),
];