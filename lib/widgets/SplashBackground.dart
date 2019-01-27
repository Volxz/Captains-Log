import 'package:flutter/material.dart';

class SplashBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      top: 0.0,
      left: 0.0,
      right: 0.0,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/frcbackgroundps.png',
        fit: BoxFit.cover,
      ),
    );
  }
}