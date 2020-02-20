import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'starrating.dart';

class Group extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("小组"),
      ),
      body: Center(
          child: StarRating(
        rating: 4,
        count: 5,
        maxRating: 10,
      )),
    );
  }
}
