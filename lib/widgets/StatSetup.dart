import 'package:flutter/material.dart';
import 'package:captains_log/pages/TeleopStatsPage.dart';

class StatSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _teamNumberController = new TextEditingController();
    final _matchNumberController = new TextEditingController();
    final FocusNode _teamNumFocus = FocusNode();
    final FocusNode _matchNumFocus = FocusNode();
    void displayTeleopStats() {
      //TODO ADD VERIFICATION
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TeleopStatsPage(num.parse(_teamNumberController.text), "Q2")));
    }

    final splashBackgroundWidget = Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/frcbackgroundps.png',
        fit: BoxFit.cover,
      ),
    );
    final teamNumberField = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: _teamNumberController,
      textInputAction: TextInputAction.next,
      focusNode: _teamNumFocus,

      onFieldSubmitted: (term){
        _teamNumFocus.unfocus();
        FocusScope.of(context).requestFocus(_matchNumFocus);
      },
      decoration: InputDecoration(
        hintText: 'Team Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final matchNumberField = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: _matchNumberController,
      textInputAction: TextInputAction.done,
      focusNode: _matchNumFocus,
      onFieldSubmitted: (term){
        _matchNumFocus.unfocus();
        displayTeleopStats();
      },
      decoration: InputDecoration(
        hintText: 'Match Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final blastOffButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          onPressed: () {displayTeleopStats();},
          padding: EdgeInsets.all(12.0),
          color: Colors.lightBlueAccent,
          child: Text('Blast Off!', style: TextStyle(color: Colors.white)),
        ));

    return new Stack(
      children: <Widget>[
        splashBackgroundWidget,
        Center(
          child: ListView(physics: PageScrollPhysics(), children: <Widget>[
            SizedBox(height: 300.0),
            teamNumberField,
            SizedBox(height: 8.0),
            matchNumberField,
            SizedBox(height: 24.0),
            blastOffButton
          ]),
        ),
      ],
    );
  }
}
