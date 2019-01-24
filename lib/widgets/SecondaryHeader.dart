import 'package:flutter/material.dart';

class SecondaryHeader extends StatelessWidget {
  final String title;
  const SecondaryHeader({Key key,this.title}): super(key : key);
  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Text(
          this.title,
          style:
          TextStyle(decoration: TextDecoration.underline, fontSize: 15.0),
        )
    );
  }
}


