import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/constants.dart';
import '../../../models/task_model.dart';
import '../home_controller.dart';

class Task extends GetView<HomeController> {
  final TaskModel task;
  final dateFormat = DateFormat('dd/MM/y');

  Task({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: context.width,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      constraints: const BoxConstraints(
        minHeight: 100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            task.description.toUpperCase(),
            style: TextStyle(
              decoration: task.finished ? TextDecoration.lineThrough : null,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            dateFormat.format(task.dateTime),
            style: const TextStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey.withOpacity(0.8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: task.finished,
                onChanged: (value) => controller.checkOrUncheckTask(task),
              ),
              IconButton(
                onPressed: () {
                  final infos =
                      'Tarefa: ${task.description.toUpperCase()}\n Data: ${dateFormat.format(task.dateTime)}';
                  controller.copyInfos(context, infos);
                },
                icon: Icon(
                  Icons.copy,
                  color: ColorsConstants.blue,
                ),
              ),
              IconButton(
                onPressed: () => controller.validatorDelete(task),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
