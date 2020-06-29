import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:studentmanagement/components/app_bar.dart';
import 'package:studentmanagement/models/student.dart';
import 'package:studentmanagement/style/style.dart';
import 'package:dio/dio.dart';

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
      body: FutureBuilder(
          future: getStudentDetails(),
          builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
              return Container(
                child: Center(
                    child: Text(
              "checking code " + widget.code,
              style: textSyle(),
            )));
          }
          return CircularProgressIndicator();
          }),
    );
  }

  // just a test
  Future getStudentDetails() async {
    var url = 'https://seven-student-manager.web.app/student/dkfjdfkj';
    var dio = Dio();
    Response response = await dio.get(url);

    if (response.statusCode == 200) {
      print(response.data);
      return response.data;
    } else {
      throw Exception('Failed to load student');
    }
  }
}
