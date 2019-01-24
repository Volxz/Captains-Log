import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final String title;
  const CategoryHeader({Key key,this.title}): super(key : key);
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text(
          this.title,
          style:
          TextStyle(decoration: TextDecoration.underline, fontSize: 30.0),
        )
    );
  }
}


