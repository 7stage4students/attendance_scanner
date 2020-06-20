import 'package:flutter/material.dart';
import 'package:studentmanagement/components/app_bar.dart';
import 'package:studentmanagement/style/style.dart';

class CheckCodeScreen extends StatefulWidget {
  final String code;

  const CheckCodeScreen({Key key, this.code}) : super(key: key);
  @override
  _CheckCodeScreenState createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Check Code"),
      backgroundColor: bgColor,
      body: Container(
          child: Center(
              child: Text(
        "checking code " + widget.code,
        style: textDark(),
      ))),
    );
  }
}
