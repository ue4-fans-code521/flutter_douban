import 'package:douban_app/models/home_model.dart';
import 'package:douban_app/network/httprequest.dart';
import 'package:douban_app/views/home/homesubcomponent/homesubcomponent.dart';
import 'package:douban_app/views/subject/subject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: NetRequestBack(),
    );
  }
}

class NetRequestBack extends StatefulWidget {
  @override
  _NetRequestBackState createState() => _NetRequestBackState();
}

class _NetRequestBackState extends State<NetRequestBack> {
  List<MovieItem> movieitems = [];

  //我们在此initstate声明阶段进行异步数据的请求
  @override
  void initState() {
    //我们需要定义一个MovieItems来存储从网络异步请求得到的数据

    super.initState();
    HttpRequest.requestresources(
            "https://douban.uieee.com/v2/movie/top250?start=0&count=20")
        .then((retval) {
//      print(retval.data["subjects"][0]["title"]);
      final subjectjson = retval.data["subjects"];
      //下面我们开始遍历subjectjson,把所遍历的结果封装成为一个MovieItem
      //再将每个封装的MovieItem添加到List<MovieItem>
      List<MovieItem> movies=[];
      for (var sub in subjectjson) {
        //把每个遍历项封装成为一个MovieItem
        movies.add(MovieItem.fromMap(sub));
      }

      setState(() {
        this.movieitems=movies;
      });
//      print(movieitems);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
          itemCount: movieitems.length,
          itemBuilder: (BuildContext context, int index) {
            return HomeSubComponent(movieitems[index]);
          }),
    );
  }
}
