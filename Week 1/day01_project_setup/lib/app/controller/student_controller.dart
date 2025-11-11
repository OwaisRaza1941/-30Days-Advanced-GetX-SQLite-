import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:day01_project_setup/app/repository/student_repository.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final StudentRepository _repository = StudentRepository();

  RxList<StudentsModel> studentsList = <StudentsModel>[].obs;

  /// Add Students
  Future<void> addStudents(StudentsModel student) async {
    final success = await _repository.addStudents(student);

    if (success) {
      getAllStudents();
    } else {
      Get.snackbar(
        'Error',
        'Failed To Add Student',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Get All Students
  Future<void> getAllStudents() async {
    final data = await _repository.getAllStudents();
    studentsList.assignAll(data);
  }

  /// Upadated Students
  Future<void> updatedStudents(StudentsModel student) async {
    final success = await _repository.updateStudent(student);

    if (success) {
      getAllStudents();
    } else {
      Get.snackbar(
        'Error',
        'Failed To Updated Student',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Delete Student
  Future<void> deleteStdudents(int id) async {
    final success = await _repository.deleteStudent(id);
    if (success) {
      getAllStudents();
    } else {
      Get.snackbar(
        'Error',
        'Failed To Delete Student',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllStudents();
  }
}
