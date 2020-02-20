import 'package:douban_app/models/home_model.dart';
import 'package:douban_app/views/group/starrating.dart';
import 'package:douban_app/views/subject/getdashline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSubComponent extends StatelessWidget {
  //我们需要传递过来一个参数movieitem
  final MovieItem item;

  //构造函数必传参数
  HomeSubComponent(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 10, color: Color(0xffdddddd))),
      ),
      child: Column(
        //交叉轴决定对其方式是左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //下面,我们可以采用函数的方式或者单独定义一个widget类的方式来获取下面的组件
          //我们采用通过函数的方式来返回需要的组件
          getRankWidget(),
          SizedBox(height: 10),
          getMiddleDetailsWidget(),
          SizedBox(height: 10),
          getDescriptionWidget(),
        ],
      ),
    );
  }

  //1.获取电影的排名的组件
  Widget getRankWidget() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "No.${item.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  //2.获取显示中间的图片,描述信息,评分,喜欢等信息呈现组件的方法
  Widget getMiddleDetailsWidget() {
    return Container(
//      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //2.1图片的显示
          getImage(),
          //2.2描述信息的显示
          getFullContent(),
          //2.3分割线的显示
          getDashLineWidget(),
          //2.4喜欢logo的显示
          getWish(),
        ],
      ),
    );
  }

  //2.1获取图片组件的方法
  Widget getImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          item.imageUrl,
          width: 150,
        ));
  }

  //2.2描述信息的显示
  Widget getFullContent() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //2.2.1上层的播放图标以及title+year
            getContentWidget(),
            //2.2.2中间层的中间部分的评分的设计
            Row(
              children: <Widget>[
                StarRating(
                  maxRating: 10,
                  size: 22,
                  count: 5,
                  rating: item.rating,
                  selectedColor: Colors.deepOrange,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "${item.rating}",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            //2.2.3中间层的下半部分的有关导演和演职人员的信息
            getIntroWidget(),
          ],
        ),
      ),
    );
  }

//*****************************************************************
//2.2.1用来显示中间的图及其详细描述部分
//注意:这里使用expanded进行包裹是十分必要的,否则是无法进行换行的.
//*****************************************************************
  Widget getContentWidget() {
    return Stack(
      children: <Widget>[
        Icon(
          Icons.play_circle_outline,
          color: Colors.red,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                //我们在此处技巧性的处理了一下-前面加上少许的空格,是为了隔绝开来符号和后面的文本
                text: "      " + item.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              TextSpan(
                text: "(${item.playDate})",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

//2.2.3返回全部演职人员信息展示的组件
  Widget getIntroWidget() {
    //先把需要的变量进行取出来,稍后一并在Text中返回
    final genres = item.genres.join(" ");
    final director = item.director.name;
    final actors = item.casts.join(" ");

    return Text(
      "$genres / $director / $actors",
      //最多显示两行的内容
      maxLines: 2,
      //显示不完,进行省略...
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 15),
    );
  }

//2.3添加分隔线组件
  Widget getDashLineWidget() {
    return Container(
      width: 4,
      height: 115,
      child: GetDashLine(
        dashWidth: 3,
        dashHeight: 8,
        ax: Axis.vertical,
        dashCounts: 8,
        clr: Color(0xffcccccc),
      ),
    );
  }

//2.4方法获取喜欢的组件
  Widget getWish() {
    return Container(
      width: 60,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: <Widget>[
          Image.asset(
            "assets/images/home/wish.png",
            width: 50,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "喜欢",
            style: TextStyle(
                color: Color.fromARGB(255, 235, 170, 60), fontSize: 16),
          ),
        ],
      ),
    );
  }

//3.通过方法来获取电影的原始信息的描述
  Widget getDescriptionWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(4),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(10),
      child: Text(
        item.originalTitle,
        style: TextStyle(
          color: Color(0xff222222),
          fontSize: 15,
        ),
      ),
    );
  }
}
