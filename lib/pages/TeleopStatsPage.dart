import 'package:flutter/material.dart';
import 'package:captains_log/widgets/TeleopStats.dart';
class TeleopStatsPage extends StatelessWidget {
  final int _team;
  final String _matchType;
  final int _matchNum;
  const TeleopStatsPage(this._team, this._matchType,this._matchNum,{Key key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TEAM $_team, MATCH $_matchType$_matchNum | Teleop Stats"),
      ),
      body: TeleopStats(),
    );
  }
}
