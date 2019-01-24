import 'package:flutter/material.dart';

String _currentOption;

class DropDownSelector extends StatefulWidget {
  final List _options;

  const DropDownSelector(this._options, {Key key}): super(key : key);

  _DropDownState createState() => new _DropDownState();

  String getCurrentOption() {
    return _currentOption;
  }
}
class _DropDownState extends State<DropDownSelector> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;

  @override
  Widget build(BuildContext context) {
    return new DropdownButton(
      value: _currentOption,
      items: _dropDownMenuItems,
      onChanged: changedDropDownItem,
    );
  }

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentOption = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String option in widget._options) {
      // here we are creating the drop down menu items, you can customize the item right here
      // but I'll just use a simple text for this
      items.add(new DropdownMenuItem(
          value: option,
          child: new Text(option)
      ));
    }
    return items;
  }

  void changedDropDownItem(String selectedOption) {
    setState(() {
      _currentOption = selectedOption;
    });
  }

  String getCurrentOption(){
    return _currentOption;
  }
}