//定义父类
class Person {
  String name;
  String avatarUrl;

  Person.fromMap(Map<String, dynamic> json) {
    this.name = json["name"];
    this.avatarUrl = json["avatars"]["medium"];
  }
}

//定义Person相应的子类Actor
class Actor extends Person {
  //我们需要调用父类的声明式构造函数
  Actor.fromMap(Map<String, dynamic> json) : super.fromMap(json);

  @override
  String toString() {
    // TODO: implement toString
    return name;
  }
}

//定义Person相应的子类Director
class Director extends Person {
  Director.fromMap(Map<String, dynamic> json) : super.fromMap(json);
}

//下面我们就来定义集成类MovieItem
int counter = 1;

class MovieItem {
  int rank;
  String title;
  String imageUrl;
  String playDate;
  double rating;
  List<String> genres;
  List<Actor> casts;
  Director director;
  String originalTitle;

  //关键的就是对于上面的成员变量进行赋值的构造函数的定义与使用
  MovieItem.fromMap(Map<String, dynamic> json) {
    this.rank = counter++;
    this.title = json["title"];
    this.imageUrl = json["images"]["medium"];
    this.playDate = json["year"];
    this.rating = json["rating"]["average"];
    //cast<String>是必须的.
    this.genres = json["genres"].cast<String>();
    //仅仅是获取第一个导演的json就可以了-->进而封装为Director对象
    this.director = Director.fromMap(json["directors"][0]);
    this.originalTitle = json["original_title"];
    //最为复杂的莫过于把演员数据进行封装成为一个list列表了.
    this.casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
  }
}
