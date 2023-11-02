import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home_controller.dart';
import 'task.dart';

class HomeTasks extends GetView<HomeController> {
  const HomeTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TAREFAS ${controller.description}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 30,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.filteredTasks.length,
            itemBuilder: (context, index) {
              final tasks = controller.filteredTasks;
              return Task(task: tasks[index]);
            },
          ),
        ],
      );
    });
  }
}
