import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/constants.dart';
import '../tasks_controller.dart';

class CalendarButton extends GetView<TasksController> {
  final DateFormat dateFormat = DateFormat('dd/MM/y');

  CalendarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(const Duration(days: 10 * 365));

        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: lastDate,
        );
        if (selectedDate != null && context.mounted) {
          controller.selectedDate = selectedDate;
        }
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.today,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 10,
            ),
            Obx(() {
              if (controller.selectedDate != null) {
                return Text(
                  dateFormat.format(controller.selectedDate!),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ColorsConstants.blue,
                  ),
                );
              } else {
                return const Text(
                  'SELECIONE UMA DATA',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
