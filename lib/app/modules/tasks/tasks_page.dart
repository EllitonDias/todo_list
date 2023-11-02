import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/widgets/todo_list_field.dart';
import '../../core/ui/widgets/todo_list_logo.dart';
import './tasks_controller.dart';
import 'widgets/calendar_button.dart';

class TasksPage extends GetView<TasksController> {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
          color: Colors.black,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorsConstants.blueLight,
        onPressed: () => controller.validator(),
        label: const Text(
          'Salvar tarefa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: RawScrollbar(
        thumbColor: ColorsConstants.blueLight,
        thumbVisibility: true,
        radius: const Radius.circular(8),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const TodoListLogo(
              label: 'Adicionar tarefa',
            ),
            Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  TodoListField(
                    label: 'Descrição',
                    controller: controller.description,
                    validator:
                        Validatorless.required('Descrição é obrigatória'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CalendarButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
