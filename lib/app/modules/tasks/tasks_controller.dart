import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/message/messages_mixin.dart';
import '../../models/message_model.dart';
import '../../services/tasks/tasks_service.dart';

class TasksController extends GetxController with MessagesMixin {
  final TasksService _tasksService;

  //obs
  final _message = Rxn<MessageModel>();
  final _selectedDate = Rxn<DateTime>();

  TasksController({required TasksService tasksService})
      : _tasksService = tasksService;

  //selectedDate setter and getter calendar
  set selectedDate(DateTime? selectedDate) {
    _selectedDate.value = selectedDate;
  }

  DateTime? get selectedDate => _selectedDate.value;

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  //form
  final formKey = GlobalKey<FormState>();
  final description = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    description.dispose();
  }

  //validator
  void validator() {
    final formValid = formKey.currentState?.validate() ?? false;
    if (formValid && _selectedDate.value != null) {
      save(description.text);
      Get.back();
    } else {
      _message(
        MessageModel.info(
          title: 'Atenção',
          message: 'Data da tarefa não selecionada',
        ),
      );
    }
  }

  //create task with selected date
  Future<void> save(String description) async {
    try {
      if (_selectedDate.value != null) {
        await _tasksService.save(_selectedDate.value!, description);
        _message(
          MessageModel.success(
            title: 'Sucesso',
            message: 'Tarefa cadastrada com sucesso',
          ),
        );
      }
    } catch (e) {
      Exception('Erro ao cadastrar tarefa $e');
      _message(
        MessageModel.error(
          title: 'Erro',
          message: 'Erro ao cadastrar tarefa',
        ),
      );
    }
  }
}
