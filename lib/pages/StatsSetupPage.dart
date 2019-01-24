import 'package:flutter/material.dart';
import 'package:captains_log/widgets/StatSetup.dart';
class StatsSetupPage extends StatelessWidget {

  const StatsSetupPage({Key key}): super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Captains Log | Stats Setup"),
      ),
      body: StatSetup(),
    );
  }
}
