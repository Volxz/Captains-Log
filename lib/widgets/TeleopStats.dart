import 'package:flutter/material.dart';
import 'package:captains_log/widgets/Counter.dart';
import 'package:captains_log/widgets/CategoryHeader.dart';
import 'package:captains_log/widgets/HeightInput.dart';
import 'package:captains_log/widgets/SecondaryHeader.dart';

class TeleopStats extends StatefulWidget {
  TeleopStats({Key key}) : super(key: key);

  @override
  _TeleopStatsState createState() => new _TeleopStatsState();
}

class _TeleopStatsState extends State<TeleopStats> {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new CategoryHeader(title: "Cargo Ship"),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[cargoShipHatchCounter, cargoShipCargoCounter],
        ),
        new CategoryHeader(title: "Rocket Ship"),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[rocketShipHatchCounter, rocketShipCargoCounter],
        ),
        SecondaryHeader(title: "Hatch Panel Placement Height"),
        rocketHatchHeight,
        SecondaryHeader(title: "Cargo Placement Height"),
        rocketCargoHeight,
        SecondaryHeader(title: "FINAL Robot Climb Height"),
        climbHeight,
      ],
    );
  }

  final rocketHatchHeight = HeightInput();
  final rocketCargoHeight = HeightInput();
  final cargoShipHatchCounter = Container(
    padding: const EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: new Counter(
      statType: "Hatch Panel",
    ),
  );
  final cargoShipCargoCounter = Container(
    padding: const EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: new Counter(
      statType: "Cargo",
    ),
  );
  final rocketShipHatchCounter = Container(
    padding: const EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: new Counter(
      statType: "Hatch Panel",
    ),
  );
  final rocketShipCargoCounter = Container(
    padding: const EdgeInsets.all(10.0),
    alignment: Alignment.center,
    child: new Counter(
      statType: "Cargo",
    ),
  );
  final climbHeight = HeightInput();

}
