import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/constants.dart';
import '../../core/ui/todo_list_icons.dart';
import './home_controller.dart';
import 'widgets/home_filters.dart';
import 'widgets/home_tasks.dart';
import 'widgets/home_week_filter.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.title),
        leading: Image.asset(ImageConstants.logo),
        actions: [
          PopupMenuButton(
            icon: const Icon(
              TodoListIcons.filter,
              color: Colors.white,
            ),
            onSelected: (value) => controller.showOrHideFinishingTasks(),
            itemBuilder: (_) => [
              PopupMenuItem<bool>(
                value: true,
                child: Text(
                  '${controller.showFinishingTasks.value ? 'ESCONDER' : 'MOSTRAR'} TAREFAS REALIZADAS',
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(
            color: ColorsConstants.blueLight,
            width: 2.0,
          ),
        ),
        onPressed: () {
          Get.toNamed(RoutersConstants.tasks);
          controller.refreshPage();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        children: const [
          HomeFilters(),
          HomeWeekFilter(),
          HomeTasks(),
        ],
      ),
    );
  }
}
