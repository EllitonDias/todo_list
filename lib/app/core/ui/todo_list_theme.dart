

import 'package:flutter/material.dart';

import 'constants.dart';

class TodoListTheme {
  static String get title => TextConstants.title;
  
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsConstants.green,
      ),
      centerTitle: true,
      backgroundColor: ColorsConstants.green,
      foregroundColor: ColorsConstants.pink,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: ColorsConstants.green,
      ),
    ),
  );
  
}