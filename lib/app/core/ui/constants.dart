import 'package:flutter/material.dart';

sealed class RoutersConstants {
  static const String splash = '/';
  static const String home = '/home';
  static const String tasks = '/tasks';
}

sealed class ImageConstants {
  static const String logo = 'assets/images/logo.png';
}

sealed class TextConstants {
  static const String title = 'TAREFAS';
}

sealed class ColorsConstants {
  static Color blue = const Color(0xFF5C77CE);
  static Color blueLight = const Color(0xffABC8F7);
}
