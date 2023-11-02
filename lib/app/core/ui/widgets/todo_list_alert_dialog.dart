import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class TodoListAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;
  const TodoListAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: ColorsConstants.blue,
          width: 2,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text(
            'CANCELAR',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'CONFIRMAR',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      title: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
