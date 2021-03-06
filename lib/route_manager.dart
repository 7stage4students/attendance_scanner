import 'package:flutter/material.dart';
import 'package:studentmanagement/screens/check_code.dart';
import 'package:studentmanagement/screens/home.dart';
import 'package:studentmanagement/screens/manage.dart';
import 'package:studentmanagement/screens/not_found.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;
      case "/notFound":
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
        break;
      case "/manage":
        return MaterialPageRoute(builder: (_)=> ManageScreen());
        break;
      case "/checkCode":
        return MaterialPageRoute(builder: (_)=> CheckCodeScreen(
          code: args,
        ));

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
