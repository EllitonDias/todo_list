import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/task_model.dart';
import 'task.dart';

class HomeTasks extends StatelessWidget {
  final List<TaskModel> tasks;
  const HomeTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Task(task: tasks[index]);
        },
      );
    });
  }
}
