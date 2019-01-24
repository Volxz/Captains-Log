import 'package:flutter/material.dart';

const Color color1 = Color(0xFF1C253C);
const Color color2 = Color(0xFF1F3E5A);
const Color color3 = Color(0xFF145051);
const Color color4 = Color(0xFF281C3C);
const Color color5 = Color(0xFF3C1C31);

ThemeData getMaterialTheme() {
  return new ThemeData(
    brightness: Brightness.dark,
    primaryColor: color4,
    accentColor: color3,
    textTheme: new TextTheme(
      body1: new TextStyle(color: Colors.white),
    )
  );
}