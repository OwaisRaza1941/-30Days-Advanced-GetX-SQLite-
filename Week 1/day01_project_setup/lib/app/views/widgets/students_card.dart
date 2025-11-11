import 'package:day01_project_setup/app/components/show_dailoge.dart';
import 'package:day01_project_setup/app/controller/student_controller.dart';
import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentsCard extends StatelessWidget {
  final StudentsModel std;
  const StudentsCard({super.key, required this.std});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = Get.find<StudentController>();
    return Card(
      child: Container(
        padding: EdgeInsets.all(20),
        height: 120,
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          title: Text(
            std.name ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(std.email ?? ''),
          trailing: Wrap(
            children: [
              IconButton(
                onPressed: () {
                  showDaloge(context: context, isEdite: true, std: std);
                },
                icon: Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () async {
                  await controller.deleteStdudents(std.id!);
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
