import 'package:day01_project_setup/app/components/text_fields.dart';
import 'package:day01_project_setup/app/controller/student_controller.dart';
import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showDaloge({
  required BuildContext context,
  bool isEdite = false,
  StudentsModel? std,
}) {
  TextEditingController nameController = TextEditingController(
    text: isEdite ? std?.name : '',
  );
  TextEditingController emailController = TextEditingController(
    text: isEdite ? std?.email : '',
  );
  TextEditingController ageController = TextEditingController(
    text: isEdite ? std?.age.toString() : '',
  );

  StudentController controller = Get.find();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(50),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(isEdite ? 'Updated Student' : "Add Student"),
            SizedBox(height: 20),

            textFields(hintText: 'Name', controller: nameController),
            SizedBox(height: 15),
            textFields(hintText: 'Email', controller: emailController),
            SizedBox(height: 15),
            textFields(hintText: 'Age', controller: ageController),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        emailController.text.isEmpty) {
                      Get.snackbar('Messege', 'All Feilds Required!');
                      return;
                    }

                    StudentsModel student = StudentsModel(
                      id: std?.id,
                      name: nameController.text,
                      email: emailController.text,
                      age: int.parse(ageController.text),
                    );

                    if (isEdite) {
                      await controller.updatedStudents(student);
                    } else {
                      await controller.addStudents(student);
                    }
                    Get.back();
                  },
                  child: Text(isEdite ? 'Updated ' : "Add "),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
