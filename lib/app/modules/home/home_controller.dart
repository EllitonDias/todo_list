import 'package:get/get.dart';

import '../../models/task_filter_enum.dart';
import '../../models/task_model.dart';
import '../../models/total_task_model.dart';
import '../../models/week_task_model.dart';
import '../../services/tasks/tasks_service.dart';

class HomeController extends GetxController {
  final TasksService _tasksService;

  HomeController({required TasksService tasksService})
      : _tasksService = tasksService;

  //Rxn
  final todayTotalTasks = Rxn<TotalTaskModel>();
  final tomorrowTotalTasks = Rxn<TotalTaskModel>();
  final weekTotalTasks = Rxn<TotalTaskModel>();
  final initialDateOfWeek = Rxn<DateTime>();
  final selectedDay = Rxn<DateTime>();
  final showFinishingTasks = false.obs;

  //obs
  final filterSelected = TaskFilterEnum.today.obs;
  final filteredTasks = <TaskModel>[].obs;
  final allTasks = <TaskModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    loadTotalTasks();
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
}
