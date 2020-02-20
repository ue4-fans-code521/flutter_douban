import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  //我们需要把用户的自定义的属性暴露给用户来自定义
  final double rating;
  final double maxRating;
  final Widget unselectedImage;
  final Widget selectedImage;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  //构造函数对上面的成员变量进行初始化
  StarRating(
      {this.rating,
      this.maxRating = 10,
      unselectedImage,
      selectedImage,
      this.count = 5,
      this.size = 30,
      this.unselectedColor = const Color(0xffbbbbbb),
      this.selectedColor = Colors.orange})
      : unselectedImage = unselectedImage ??
            Icon(
              Icons.star,
              color: unselectedColor,
              size: size,
            ),
        selectedImage = selectedImage ??
            Icon(
              Icons.star,
              color: selectedColor,
              size: size,
            );

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //我们来定义两个方法,来分别获取未点赞的star和已经获取点赞的star
        getUnselectedStar(),
        getSelectedStar()
      ],
    );
  }

  //未点赞的star获取函数
  Widget getUnselectedStar() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.count, (int index) {
        return widget.unselectedImage;
      }),
    );
  }

  Widget getSelectedStar() {
    //在选中状态下的star还是有很多的逻辑去实现的
    //1.究竟应该需要点亮几颗星
    //每科点亮的星所需要的分数
    double avgLengthStar = widget.maxRating / widget.count;
    //应该点亮的个数
    int lightStarNum = (widget.rating / avgLengthStar).floor();
    //求出剩余的不足点亮一个
    double leftUnlightStar = widget.rating - lightStarNum * avgLengthStar;
    //根据leftUnlightStar换算出需要裁减的比例
    double ratioStar = leftUnlightStar / avgLengthStar;

    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(lightStarNum + 1, (int index) {
          if (index < lightStarNum) return widget.selectedImage;
          return ClipRect(
            clipper: MyClipper(width: widget.size * ratioStar),
            child: widget.selectedImage,
          );
        }));
  }
}

//我们需要自定义一个抽象类CustomClipper的实现子类
class MyClipper extends CustomClipper<Rect> {
  double width;

  MyClipper({this.width});

  //返回需要剪切的Rect的大小
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  //决定是否需要剪切bool值
  @override
  bool shouldReclip(MyClipper oldClipper) {
    return width != oldClipper.width;
  }
}
