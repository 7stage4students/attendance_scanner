import 'package:flutter/material.dart';
import 'package:studentmanagement/route_manager.dart';
import 'package:studentmanagement/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seven Student Manager',
      theme: getTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,

    );
  }
}

