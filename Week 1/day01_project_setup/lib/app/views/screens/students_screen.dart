import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:day01_project_setup/app/controller/student_controller.dart';
import 'package:day01_project_setup/app/views/widgets/students_card.dart';
import 'package:day01_project_setup/app/components/show_dailoge.dart'; // or renamed

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showStudentDialog(context: context, isEdit: false),
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Obx(() {
          if (controller.isLoading.value)
            return Center(child: CircularProgressIndicator());
          if (controller.studentsList.isEmpty)
            return Center(child: Text('No Students Yet'));
          return ListView.separated(
            itemCount: controller.studentsList.length,
            separatorBuilder: (_, __) => SizedBox(height: 10),
            itemBuilder: (_, i) =>
                StudentsCard(std: controller.studentsList[i]),
          );
        }),
      ),
    );
  }
}
