import 'package:flutter/material.dart';
import 'package:captains_log/widgets/TeleopStats.dart';
class TeleopStatsPage extends StatelessWidget {
  final int _team;
  final String _match;
  const TeleopStatsPage(this._team, this._match,{Key key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$_team , $_match | Teleop Statistics"),
      ),
      body: TeleopStats(),
    );
  }
}
