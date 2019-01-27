import 'package:flutter/material.dart';
import 'package:captains_log/pages/TeleopStatsPage.dart';
import 'package:captains_log/widgets/SplashBackground.dart';

String _matchType = "unset";

class StatSetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _teamNumberController = new TextEditingController();
    final _matchNumberController = new TextEditingController();
    final FocusNode _teamNumFocus = FocusNode();
    final FocusNode _matcTypeFocus = FocusNode();
    final FocusNode _matchNumFocus = FocusNode();

    void displayTeleopStats() {
      //TODO ADD VERIFICATION
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => TeleopStatsPage(
                  num.parse(_teamNumberController.text),
                  _matchType,
                  num.parse(_matchNumberController.text))));
    }

    final teamNumberField = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      controller: _teamNumberController,
      textInputAction: TextInputAction.next,
      focusNode: _teamNumFocus,
      onFieldSubmitted: (term) {
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
      onFieldSubmitted: (term) {
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
          onPressed: () {
            displayTeleopStats();
          },
          padding: EdgeInsets.all(12.0),
          color: Colors.lightBlueAccent,
          child: Text('Blast Off!', style: TextStyle(color: Colors.white)),
        ));

    return new Stack(
      children: <Widget>[
        SplashBackground(),
        Center(
          child: ListView(physics: PageScrollPhysics(), children: <Widget>[
            SizedBox(height: 300.0),
            teamNumberField,
            SizedBox(height: 8.0),
            Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: 30.0,
                height: 30.0,
                child: new DropDownSelector()),
            matchNumberField,
            SizedBox(height: 24.0),
            blastOffButton
          ]),
        ),
      ],
    );
  }
}

class DropDownSelector extends StatefulWidget {
  const DropDownSelector({Key key}) : super(key: key);

  _DropDownState createState() => new _DropDownState();
}

class _DropDownState extends State<DropDownSelector> {
  List _options = ['p', 'q', 'f'];
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  Widget build(BuildContext context) {
    return new DropdownButton(
      value: _matchType,
      items: _dropDownMenuItems,
      onChanged: changedDropDownItem,
    );
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _matchType = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String option in _options) {
      items.add(new DropdownMenuItem(value: option, child: new Text(option)));
    }
    return items;
  }

  void changedDropDownItem(String selectedOption) {
    setState(() {
      _matchType = selectedOption;
    });
  }
}
