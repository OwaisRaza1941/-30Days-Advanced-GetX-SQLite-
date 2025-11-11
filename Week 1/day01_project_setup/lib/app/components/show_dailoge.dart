import 'package:day01_project_setup/app/components/text_fields.dart';
import 'package:day01_project_setup/app/controller/student_controller.dart';
import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showStudentDialog({
  required BuildContext context,
  required bool isEdit,
  StudentsModel? std,
}) {
  final nameController = TextEditingController(text: isEdit ? std?.name : '');
  final emailController = TextEditingController(text: isEdit ? std?.email : '');
  final ageController = TextEditingController(
    text: isEdit ? (std?.age?.toString() ?? '') : '',
  );

  final StudentController controller = Get.find();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(isEdit ? 'Update Student' : 'Add Student'),
        contentPadding: EdgeInsets.all(20),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              textFields(hintText: 'Name', controller: nameController),
              SizedBox(height: 12),
              textFields(hintText: 'Email', controller: emailController),
              SizedBox(height: 12),
              textFields(hintText: 'Age', controller: ageController),
            ],
          ),
        ),
        actions: [
          Obx(() {
            final saving = controller.isSaving.value;
            return TextButton(
              onPressed: saving ? null : () => Get.back(),
              child: Text('Cancel'),
            );
          }),
          Obx(() {
            final saving = controller.isSaving.value;
            return ElevatedButton(
              onPressed: saving
                  ? null
                  : () async {
                      // Validation
                      if (nameController.text.trim().isEmpty ||
                          emailController.text.trim().isEmpty) {
                        Get.snackbar('Validation', 'All fields are required');
                        return;
                      }
                      final ageVal = int.tryParse(ageController.text.trim());
                      if (ageVal == null) {
                        Get.snackbar('Validation', 'Valid age required');
                        return;
                      }

                      final student = StudentsModel(
                        id: isEdit ? std?.id : null,
                        name: nameController.text.trim(),
                        email: emailController.text.trim(),
                        age: ageVal,
                      );

                      if (isEdit) {
                        await controller.updatedStudents(student);
                      } else {
                        await controller.addStudents(student);
                      }

                      if (!controller.isSaving.value) Get.back();
                    },
              child: saving
                  ? SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(isEdit ? 'Update' : 'Add'),
            );
          }),
        ],
      );
    },
  );
}
