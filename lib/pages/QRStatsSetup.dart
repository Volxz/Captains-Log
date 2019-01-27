import 'dart:async';
import 'package:captains_log/widgets/SplashBackground.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MatchInfoScan extends StatefulWidget {
  @override
  _ScanState createState() => new _ScanState();
}

class _ScanState extends State<MatchInfoScan> {
  String errcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future scan() async {
      try {
        String barcode = await BarcodeScanner.scan();
        setState(() {
          if(!barcode.startsWith("CL-MATCHINFO-")){
            this.errcode = 'INVALID QR CODE';
            return;
          }
          String rawMdata = barcode.replaceAll("CL-MATCHINFO-", "");
          int teamID = num.parse(rawMdata.split('|')[0]);
          String matchType = rawMdata.split('|')[1];
          int matchNum = num.parse(rawMdata.split('|')[2]);

          this.errcode = barcode;
        });
      } on PlatformException catch (e) {
        if (e.code == BarcodeScanner.CameraAccessDenied) {
          setState(() {
            this.errcode = 'You must grant the camera permission!';
          });
        } else {
          setState(() => this.errcode = 'Unknown error: $e');
        }
      } on FormatException {
        setState(() =>
        this.errcode = 'No barcode scanned');
      } catch (e) {
        setState(() => this.errcode = 'Unknown error: $e');
      }
    }

    return Center(
      child: new Stack(children: <Widget>[
        new SplashBackground(),
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                  onPressed: scan,
                  child: const Text('Match Setup With Code')
              ),
            ), Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(errcode, textAlign: TextAlign.center, style: new TextStyle(fontSize: 20.0, color: Colors.white, decoration: TextDecoration.none),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  splashColor: Colors.blueGrey,
                  onPressed: scan,
                  child: const Text('Manual Match Setup')
              ),
            ),
          ],
        ),
      ],)
    );
  }
}