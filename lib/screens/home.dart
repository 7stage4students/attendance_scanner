import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _qrInfo = 'Scan a QR/Bar code';
  bool cameraOn = true;

  double cameraHeight = 100;


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
      appBar: AppBar(
        title: Text("Seven Advanced Academy"),
        backgroundColor: Color(0xff00ab9f),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: cameraOn  ? QRBarScannerCamera(
                onError: (context, error) => Text(
                  error.toString(),
                  style: TextStyle(color: Colors.red),
                ),
                qrCodeCallback: (code) {

                  manageQRCode(code);
                },
                fit: BoxFit.cover,
              ):Container(),
            ),
            Positioned(
              child: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),

                    ),
                  ),
                ),
              ),
            ),
            Positioned(

              child: Padding(
                padding: const EdgeInsets.only(bottom:48.0),
                child: Align(

                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  SpinKitRipple(
                  color: Colors.white,
                    size: 50.0,
                  ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Text("Scanning", style: TextStyle(
                          fontSize: 24,
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.w600
                        ),),
                      ),
                    ],
                  ),
                ),
              ),
            ),Positioned(

              child: Padding(
                padding: const EdgeInsets.only(top:48.0),
                child: Align(

                  alignment: Alignment.topCenter,
                  child: Text("Scan Student QR Code.", style: TextStyle(
                    fontSize: 24,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),

          ],
        ),
      )

    );
  }

  manageQRCode(String code) {
    setState(() {
      cameraOn = false;
    });
    print(code);
    ///check if code an valid
    ///get student data from  api
    Navigator.of(context).pushNamed("/checkCode", arguments: code).then((value) => setState((){
      cameraOn = true;
    }));


  }
}

