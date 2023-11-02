import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants.dart';

class TodoListLogo extends StatelessWidget {
  final String label;
  const TodoListLogo({super.key, this.label = 'Todo List'});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstants.logo,
          height: context.heightTransformer(reducedBy: 80),
        ),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
