import 'package:day01_project_setup/app/components/show_dailoge.dart';
import 'package:day01_project_setup/app/controller/student_controller.dart';
import 'package:day01_project_setup/app/views/widgets/students_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Get.find<StudentController>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDaloge(context: context, isEdite: false);
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Obx(() {
          return controller.studentsList.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.studentsList.length,
                  itemBuilder: (context, index) {
                    return StudentsCard(std: controller.studentsList[index]);
                  },
                )
              : Center(child: Text('No Students Yets'));
        }),
      ),
    );
  }
}
