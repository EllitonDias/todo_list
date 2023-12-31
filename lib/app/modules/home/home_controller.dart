import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/ui/constants.dart';
import '../../core/ui/widgets/todo_list_alert_dialog.dart';
import '../../models/task_filter_enum.dart';
import '../../models/task_model.dart';
import '../../models/total_task_model.dart';
import '../../models/week_task_model.dart';
import '../../services/tasks/tasks_service.dart';

class HomeController extends GetxController {
  final TasksService _tasksService;
  final Bool? result;
  HomeController({required TasksService tasksService, this.result})
      : _tasksService = tasksService;

  //Rxn
  var todayTotalTasks = Rxn<TotalTaskModel>();
  var tomorrowTotalTasks = Rxn<TotalTaskModel>();
  var weekTotalTasks = Rxn<TotalTaskModel>();
  final initialDateOfWeek = Rxn<DateTime>();
  final selectedDay = Rxn<DateTime>();

  //obs
  final filterSelected = TaskFilterEnum.today.obs;
  final filteredTasks = <TaskModel>[].obs;
  final allTasks = <TaskModel>[].obs;
  final showFinishingTasks = false.obs;

  //get
  String get description => filterSelected.value.description;

  @override
  void onInit() {
    super.onInit();
    loadTotalTasks();
    findTaks(filter: filterSelected.value);
  }

  //load total tasks for today, tomorrow and week
  Future<void> loadTotalTasks() async {
    final allTasks = await Future.wait([
      _tasksService.getToday(),
      _tasksService.getTomorrow(),
      _tasksService.getWeek(),
    ]);
    final todayTasks = allTasks[0] as List<TaskModel>;
    final tomorrowTasks = allTasks[1] as List<TaskModel>;
    final weekTasks = allTasks[2] as WeekTaskModel;

    todayTotalTasks.value = TotalTaskModel(
      totalTasks: todayTasks.length,
      totalTasksFinish: todayTasks.where((task) => task.finished).length,
    );
    tomorrowTotalTasks.value = TotalTaskModel(
      totalTasks: tomorrowTasks.length,
      totalTasksFinish: tomorrowTasks.where((task) => task.finished).length,
    );
    weekTotalTasks.value = TotalTaskModel(
      totalTasks: weekTasks.tasks.length,
      totalTasksFinish: weekTasks.tasks.where((task) => task.finished).length,
    );
  }

  //delete
  Future<void> delete(TaskModel taskModel) async {
    try {
      await _tasksService.delete(taskModel);
      refreshPage();
    } catch (e) {
      Exception(e);
    }
  }

  //valiador delete card
  void validatorDelete(TaskModel taskModel) {
    Get.dialog(
      TodoListAlertDialog(
        title: 'Excluir Tarefa',
        content:
            'Tem certeza de que deseja deletar esta tarefa? Esta ação não pode ser desfeita.',
        onPressed: () {
          delete(taskModel);
          Get.back();
        },
      ),
    );
  }


  //filter tasks by today, tomorrow and week
  Future<void> findTaks({required TaskFilterEnum filter}) async {
    filterSelected.value = filter;
    List<TaskModel> tasks;
    switch (filter) {
      case TaskFilterEnum.today:
        tasks = await _tasksService.getToday();
        break;
      case TaskFilterEnum.tomorrow:
        tasks = await _tasksService.getTomorrow();
        break;
      case TaskFilterEnum.week:
        final weekModel = await _tasksService.getWeek();
        initialDateOfWeek.value = weekModel.startDate;
        tasks = weekModel.tasks;
        break;
    }

    filteredTasks.assignAll(tasks);
    allTasks.assignAll(tasks);

    if (filter == TaskFilterEnum.week) {
      if (selectedDay.value != null) {
        filterByDay(selectedDay.value!);
      } else {
        filterByDay(initialDateOfWeek.value!);
      }
    } else {
      selectedDay.value = null;
    }

    if (!showFinishingTasks.value) {
      filteredTasks.value =
          filteredTasks.where((task) => !task.finished).toList();
    }
    refreshPage();
  }

  //filter by day
  void filterByDay(DateTime date) {
    selectedDay.value = date;
    filteredTasks.value = allTasks.where((task) {
      return task.dateTime == selectedDay.value;
    }).toList();
  }

  //check or uncheck task
  Future<void> checkOrUncheckTask(TaskModel taskModel) async {
    final taskUpdate = taskModel.copyWith(
      finished: !taskModel.finished,
    );
    await _tasksService.checkOrUncheckTask(taskUpdate);
    refreshPage();
  }

  //percent finish tasks
  double getPercentFinish(TotalTaskModel? totalTaskModel) {
    final total = totalTaskModel?.totalTasks ?? 0.0;
    final totalFinish = totalTaskModel?.totalTasksFinish ?? 0.1;

    if (total == 0) {
      return 0;
    }

    final percent = (totalFinish * 100) / total;
    return percent / 100;
  }

  //shoe or hide finishing tasks
  void showOrHideFinishingTasks() {
    showFinishingTasks.value = !showFinishingTasks.value;
    refreshPage();
  }

  //refresh page after update
  Future<void> refreshPage() async {
    await findTaks(filter: filterSelected.value);
    await loadTotalTasks();
  }

  //copy infos
  void copyInfos(BuildContext context, String description) {
    Clipboard.setData(
      ClipboardData(
        text: description,
      ),
    ).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorsConstants.blue,
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          content: const Text(
            'Copiado para a área de transferência!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    });
  }
}
