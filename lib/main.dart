import 'package:douban_app/components/itembar.dart';
import 'package:douban_app/views/group/group.dart';
import 'package:douban_app/views/home/home.dart';
import 'package:douban_app/views/mall/mall.dart';
import 'package:douban_app/views/profile/profile.dart';
import 'package:douban_app/views/subject/subject.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '豆瓣app',
      theme: ThemeData(
        primaryColor: Colors.green,
        highlightColor: Colors.transparent, //取消选中高亮显示的效果
        splashColor: Colors.transparent, //取消鼠标点击时的水波纹效果
      ),
      home: MyStackPage(),
    );
  }
}

class MyStackPage extends StatefulWidget {
  @override
  State createState() {
    return MyStackPageState();
  }
}

class MyStackPageState extends State<MyStackPage> {
  //设置点击状态标签的下标变量,在点击事件中,我们需要动态的改变其值
  var _currindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //这是脚手架工具中的底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //设置底部点击的时候,不要显示位置上动态的效果,只需要固定彼此之间的位置即可.
        currentIndex: this._currindex,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        iconSize: 30,
        items: [
          ItemBar("home", "首页"),
          ItemBar("subject", "影音"),
          ItemBar("group", "小组"),
          ItemBar("mall", "市集"),
          ItemBar("profile", "自己"),
        ],
        //下面我们需要监听此刻点击的的标签,从而可以改变他们选中的状态
        onTap: (int index) {
          setState(() {
            this._currindex = index;
          });
        },
      ),
      body: IndexedStack(
        index: _currindex,
        children: <Widget>[
          //我们可以通过该组件,把自定定义的各个的分页管理起来
          //并且通过下标进行实时的切换
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile(),
        ],
      ),
    );
  }
}
