import 'dart:math';

import 'package:flutter/material.dart';

//Bar的调色板，用来动态的变换bar的颜色使用
class ColorPalette {
  static final ColorPalette primary = new ColorPalette(
      <Color>[
        Colors.blue[400],
        Colors.red[400],
        Colors.green[400],
        Colors.yellow[400],
        Colors.purple[400],
        Colors.orange[400],
        Colors.teal[400],
      ]
  );

  // 创建颜色集合
  final List<Color> _colors;

  // 返回集合中的元素数量
  int get length => _colors.length;

  // 生成一个非负随机整数，范围从0到max（包括max）
  Color random(Random random) => this[random.nextInt(length)];

  // 构造函数
  ColorPalette(List<Color> colors) :_colors=colors {
    // bool isNotEmpty：如果此集合中至少有一个元素，则返回true
    assert(colors.isNotEmpty);
  }

  Color operator [](int index) => _colors[index % length];

}