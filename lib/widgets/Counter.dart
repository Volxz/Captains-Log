import 'package:flutter/material.dart';
import 'package:captains_log/Theme.dart';
class Counter extends StatefulWidget {
  final String statType;

  const Counter({Key key, this.statType}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              widget.statType,
              style: new TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new Text(
              "$_count",
              style: new TextStyle(
                  fontSize: 64.0,
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    child: new IconButton(
                      icon: const Icon(Icons.expand_more),
                      onPressed: sub,
                      iconSize: 48.0,
                      color: const Color(0xFF000000),
                    ),
                    color: const Color(0xFFff0000),
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                  ),
                  new Container(
                    child: new IconButton(
                      icon: const Icon(Icons.expand_less),
                      onPressed: add,
                      iconSize: 48.0,
                      color: const Color(0xFF000000),
                    ),
                    color: const Color(0xFF39b607),
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                  )
                ])
          ]),
      color: color2,
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
    );
  }

  int getVal() {
    return _count;
  }

  void add() {
    setState(() {
      _count++;
    });

  }

  void sub() {
    if (_count >= 1) {
      setState(() {
        _count--;
      });
    }
  }
}
