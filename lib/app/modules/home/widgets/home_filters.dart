import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/task_filter_enum.dart';
import '../home_controller.dart';
import 'todo_card_filter.dart';

class HomeFilters extends GetView<HomeController> {
  const HomeFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TodoCardFilter(
              label: 'HOJE',
              taskFilterEnum: TaskFilterEnum.today,
              totalTaskModel: controller.todayTotalTasks.value,
              selected: controller.filterSelected.value == TaskFilterEnum.today,
            ),
            TodoCardFilter(
              label: 'AMANHÃ',
              taskFilterEnum: TaskFilterEnum.tomorrow,
              totalTaskModel: controller.tomorrowTotalTasks.value,
              selected:
                  controller.filterSelected.value == TaskFilterEnum.tomorrow,
            ),
            TodoCardFilter(
              label: 'SEMANA',
              taskFilterEnum: TaskFilterEnum.week,
              totalTaskModel: controller.weekTotalTasks.value,
              selected: controller.filterSelected.value == TaskFilterEnum.week,
            ),
          ],
        ),
      );
    });
  }
}
