  import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:studentmanagement/style/style.dart';

Future getStudentDetails(BuildContext context, String matricule) async {
    var url = 'https://seven-student-manager.web.app/student/' + matricule;
    var dio = Dio();
    
    try {
       Response response = await dio.get(url);


    if (response.statusCode == 200) {
      print(response.data);
      Navigator.of(context).pushNamed("/manage");
      return response.data;

    } else {
      print(response.statusCode);
      throw Exception('Failed to load student');
    }
    } catch (e) {
      print(e);
    }
   
  }





   showStudentInfo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => NetworkGiffyDialog(
        image: Image.asset(
          "assets/img/freddy.jpg",
          fit: BoxFit.cover,
        ),
        title: Text('Tamwo Nechie Freddy',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600)),
        description: Text(
          'Do you want to mark name as present ?',
          textAlign: TextAlign.center,
        ),
        entryAnimation: EntryAnimation.DEFAULT,
        onOkButtonPressed: () {},
        buttonOkText: Text(
          'Yes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        buttonOkColor: primary,
      ),
    );
  }