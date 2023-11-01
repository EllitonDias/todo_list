import 'package:flutter/material.dart';

sealed class RoutersConstants {
  static const String home = '/home';
}

sealed class ImageConstants {
  static const String logo = 'assets/images/logo.png';
  static const String header = 'assets/images/header.png';
}

sealed class TextConstants {
  static const String title = 'Tarefas';
}

sealed class ColorsConstants {
  static Color green = const Color(0xFF00DEC7);
  static Color pink = const Color(0xFFD761ED);
}
