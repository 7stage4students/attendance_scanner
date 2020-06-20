import 'package:flutter/material.dart';

final primary = const Color(0xFF00AB9F);
final secondary = const Color(0xFF52898B);
final tertiary = const Color(0xFFF89623);
final bgColor = const Color(0xFF273742);

//--------------------------- Theme data ----------------------------

ThemeData getTheme() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: 'rubik',
  );
}

//--------------------------- screen height & width ----------------------------

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

//----------------------------- text-styles sans Regular ------------------

TextStyle name() {
  return TextStyle();
}

TextStyle textDarkBg() {
  return TextStyle(
    fontSize: 24,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
}

TextStyle textDarkDesc() {
  return TextStyle(
    fontSize: 16,
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.w600,
  );
}

TextStyle textDark() {
  return TextStyle(
    fontSize: 18.0,
    color: tertiary,
    fontWeight: FontWeight.w600,
  );
}

TextStyle scanStyle() {
  return TextStyle(fontSize: 16, color: tertiary, fontWeight: FontWeight.w600);
}
