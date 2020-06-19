import 'package:flutter/material.dart';


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
      body: Container(
        child:Center(child: Text("checking code" + widget.code))
      ),
    );
  }
}
