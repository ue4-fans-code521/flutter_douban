import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自己"),
      ),
      body: Center(
          child: Text(
        "自己",
        style: TextStyle(fontSize: 30),
      )),
    );
  }
}
