import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/task_model.dart';
import '../../services/tasks/tasks_service.dart';

class TasksController extends GetxController {
  final TasksService _tasksService;

  final _selectedDate = Rxn<DateTime>();

  TasksController({required TasksService tasksService})
      : _tasksService = tasksService;

  set selectedDate(DateTime? selectedDate) {
    _selectedDate.value = selectedDate;
  }

  DateTime? get selectedDate => _selectedDate.value;

  //form
  final formKey = GlobalKey<FormState>();
  final description = TextEditingController();

  //validator
  void validator(TaskModel? taskModel) {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid) {
      if (taskModel != null) {
      } else {}
      //back
      Get.back();
    }
  }
}
