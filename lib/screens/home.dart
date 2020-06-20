import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studentmanagement/style/style.dart';

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
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, bottom: 20.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("7 Advanced Academy", style: textDarkBg()),
                SizedBox(height: 20.0),
                Text("Scan Student QR Code.", style: textDarkDesc()),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: bgColor,
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
                          border: Border.all(color: tertiary),
                        ),
                        child: QRBarScannerCamera(
                          onError: (context, error) => Text(
                            error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          qrCodeCallback: (code) {
                            manageQRCode(code);
                          },
                          notStartedBuilder: (context) {
                            return Center(
                              child: Text(
                                "Loading Scanner Camera...",
                                style: textDark(),
                              ),
                            );
                          },
                          offscreenBuilder: (context) {
                            return Center(
                              child: Text(
                                'Scanner Camera Paused.',
                                style: textDark(),
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

  manageQRCode(String code) {
    setState(() {
      cameraOn = false;
    });
    print(code);

    ///check if code an valid
    ///get student data from  api
    Navigator.of(context)
        .pushNamed("/checkCode", arguments: code)
        .then((value) => setState(() {
              cameraOn = true;
            }));
  }
}
