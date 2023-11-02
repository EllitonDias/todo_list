import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/constants.dart';
import '../../../models/task_filter_enum.dart';
import '../home_controller.dart';

class HomeWeekFilter extends GetView<HomeController> {
  const HomeWeekFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Visibility(
          visible: controller.filterSelected.value == TaskFilterEnum.week,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'DIA DA SEMANA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 95,
                child: DatePicker(
                  controller.initialDateOfWeek.value ?? DateTime.now(),
                  locale: 'pt_BR',
                  initialSelectedDate:
                      controller.initialDateOfWeek.value ?? DateTime.now(),
                  selectionColor: ColorsConstants.blue,
                  selectedTextColor: Colors.white,
                  daysCount: 7,
                  monthTextStyle: const TextStyle(
                    fontSize: 8,
                  ),
                  dayTextStyle: const TextStyle(
                    fontSize: 13,
                  ),
                  dateTextStyle: const TextStyle(
                    fontSize: 13,
                  ),
                  onDateChange: (selectedDate) =>
                      controller.filterByDay(selectedDate),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
