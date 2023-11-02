import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/ui/constants.dart';
import '../../../models/task_filter_enum.dart';
import '../../../models/total_task_model.dart';
import '../home_controller.dart';

class TodoCardFilter extends GetView<HomeController> {
  final String label;
  final TaskFilterEnum taskFilterEnum;
  final TotalTaskModel? totalTaskModel;
  final bool selected;

  const TodoCardFilter({
    super.key,
    required this.label,
    required this.taskFilterEnum,
    this.totalTaskModel,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.findTaks(filter: taskFilterEnum);
      },
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 120,
            maxWidth: 150,
          ),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: selected ? ColorsConstants.blue : Colors.white,
            border: Border.all(
              color: Colors.grey.withOpacity(0.8),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${totalTaskModel?.total ?? 0} Tasks',
                style: TextStyle(
                  fontSize: 10,
                  color: selected ? Colors.white : Colors.grey,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.black,
                ),
              ),
              TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 1),
                tween: Tween(
                  begin: 0.0,
                  end: controller.getPercentFinish(totalTaskModel),
                ),
                builder: (context, value, child) {
                  return LinearProgressIndicator(
                    backgroundColor:
                        selected ? ColorsConstants.blueLight : Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      selected ? Colors.white : ColorsConstants.blue,
                    ),
                    value: value,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
