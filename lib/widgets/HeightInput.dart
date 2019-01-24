import 'package:flutter/material.dart';

class HeightInput extends StatefulWidget {
  int _selected = 1;

  @override
  _HeightInputState createState() => new _HeightInputState();
  int getVal() {
    return _selected;
  }
}

class _HeightInputState extends State<HeightInput> {

  void onChanged(int value) {
    setState(() {
      widget._selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,4.0),
              child: Column(children: <Widget>[
                new Radio(groupValue: widget._selected, value: 1, onChanged: onChanged),
                new Text("Level 1"),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,4.0),
              child: Column(children: <Widget>[
                new Radio(groupValue: widget._selected, value: 2, onChanged: onChanged),
                new Text("Level 2"),
              ],),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,4.0),
              child: Column(children: <Widget>[
                new Radio(groupValue: widget._selected, value: 3, onChanged: onChanged),
                new Text("Level 3"),
              ],),
            )
          ]),
    );
  }


}
