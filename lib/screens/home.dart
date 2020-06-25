import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studentmanagement/models/student.dart';
import 'package:studentmanagement/style/style.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool cameraOn = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      cameraOn = true;
    });
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tertiary.withOpacity(.9),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 20.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("7 Advanced Academy", style: titleStyle()),
                SizedBox(height: 20.0),
                Text("Scan Student QR Code.", style: subTitleStyle()),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: cameraOn
                  ? Center(
                      child: Container(
                        width: screenWidth(context) / 1.3,
                        height: screenHeight(context) / 2.6,
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.white.withOpacity(0.8)),
                            ),
                        child: QRBarScannerCamera(
                          onError: (context, error) => Text(
                            error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          qrCodeCallback: (code) {
                            getData();
                            manageQRCode(code);
                          },
                          notStartedBuilder: (context) {
                            return Center(
                              child: Text(
                                "Loading Scanner Camera...",
                                style: textSyle(),
                              ),
                            );
                          },
                          offscreenBuilder: (context) {
                            return Center(
                              child: Text(
                                'Scanner Camera Paused.',
                                style: textSyle(),
                              ),
                            );
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SpinKitRipple(
                                  color: tertiary,
                                  size: 50.0,
                                ),
                                Text("Scanning", style: scanStyle()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(),
            ),
          ),
        ],
      ),
    );
  }

  // just a test
  Future<Student> getData() async {
    var url = 'https://jsonplaceholder.typicode.com/users/1';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      return Student.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load student');
    }
  }

  manageQRCode(String code) {
    setState(() {
      cameraOn = false;
    });
    print(code);

    // String studentCode;

    /// go to check code
    Navigator.of(context)
        .pushNamed("/checkCode", arguments: code)
        .then((value) => setState(() {
              cameraOn = true;
            }));

    ///check if code an valid
    // if (code == studentCode) {
    //   ///get student data from  api

    //   /// go to manage
    //   Navigator.of(context).pushNamed("/manage").then((value) => setState(() {
    //         cameraOn = true;
    //       }));
    // } else {
    //   Navigator.of(context).pushNamed("/notFound").then((value) => setState(() {
    //         cameraOn = true;
    //       }));
    // }
  }
}
