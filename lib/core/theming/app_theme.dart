import 'package:flutter/material.dart';

enum AppTheme {
  light("Light"),
  dark('Dark');

  const AppTheme(this.name);
  final String name;
}

final appthemedata = {
  AppTheme.light: ThemeData(
    brightness: Brightness.light,
    appBarTheme:const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),

    ) ,
    scaffoldBackgroundColor:Colors.white,
  ),
  AppTheme.dark: ThemeData(
   brightness: Brightness.dark,
    scaffoldBackgroundColor:Colors.black,
       appBarTheme:const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.red),

    ) ,
  )
};
