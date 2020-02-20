import 'package:douban_app/views/subject/getdashline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("影音"),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 300,
          color: Colors.purple,
          child: GetDashLine(
            ax: Axis.vertical,
            dashHeight: 15,
            dashWidth: 4,
            dashCounts: 15,
          ),
        ),
      ),
    );
  }
}
