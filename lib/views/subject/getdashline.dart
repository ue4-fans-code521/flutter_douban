import 'package:flutter/material.dart';


///我们专门定义这样的一个类来提供各种各样的虚线、实线，以后就可以作为独立的模块
///来进入到自己的项目中需要的场合之中来使用
class GetDashLine extends StatelessWidget {
//我们需要定义几个接收传递过来的参数的成员变量
  final Axis ax;
  final double dashWidth;
  final double dashHeight;
  final int dashCounts;
  final Color clr;

  //我们还需要提供相应的构造函数
  GetDashLine(
      {this.ax = Axis.horizontal,
      this.dashHeight = 2,
      this.dashWidth = 5,
      this.dashCounts = 10,
      this.clr = const Color(0xffbbbbbb)});

  @override
  Widget build(BuildContext context) {
    return Flex(
        direction: this.ax,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(this.dashCounts, (index) {
          return Container(
            color: this.clr,
            width: this.dashWidth,
            height: this.dashHeight,
          );
        }));
  }
}
