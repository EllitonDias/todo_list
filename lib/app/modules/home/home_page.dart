import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../core/ui/constants.dart';
import './home_controller.dart';
import 'widgets/home_filters.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: CircleBorder(
          side: BorderSide(
            color: ColorsConstants.blueLight,
            width: 2.0,
          ),
        ),
        onPressed: () => Get.toNamed(RoutersConstants.tasks),
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          HomeFilters(),
        ],
      ),
    );
  }
}
