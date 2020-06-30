import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:studentmanagement/components/app_bar.dart';
import 'package:studentmanagement/style/style.dart';

class ManageScreen extends StatefulWidget {
  final String matricule;

  const ManageScreen({Key key, this.matricule}) : super(key: key);
  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("Manage"),
      backgroundColor: greyBackground,
      body: Center(
        child: Container(
          child: RaisedButton(
            color: Colors.teal,
            child: Text(
              'Giffy dialog',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: _showUserInfo,
          ),
        ),
      ),
    );
  }

  Future<Null> _showUserInfo() {
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
}
