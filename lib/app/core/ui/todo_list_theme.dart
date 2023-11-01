import 'package:flutter/material.dart';

import 'constants.dart';

class TodoListTheme {
  static String get title => TextConstants.title;

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: ColorsConstants.blue,
      ),
      centerTitle: true,
      backgroundColor: ColorsConstants.blue,
      foregroundColor: ColorsConstants.blueLight,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
