import 'package:flutter/material.dart';

import '../constants.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          ImageConstants.logo,
          height: 200,
        ),
        const Text(
          'Tarefas',
        ),
      ],
    );
  }
}
