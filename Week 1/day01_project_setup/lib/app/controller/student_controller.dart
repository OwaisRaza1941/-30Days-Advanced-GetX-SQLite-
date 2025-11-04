import 'package:day01_project_setup/app/data/dao/students_dao.dart';
import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final StudentsDAO _studentsDAO = StudentsDAO();

  RxList<StudentsModel> studentsList = <StudentsModel>[].obs;

  Future<void> addStudents(StudentsModel student) async {
    final success = await _studentsDAO.addStudent(student);

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
    studentsList.value = await _studentsDAO.getAllStudents();
  }

  /// Upadated Students
  Future<void> updatedStudents(StudentsModel student) async {
    final success = await _studentsDAO.updateStudent(student);

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
    final success = await _studentsDAO.deleteStudent(id);
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
}
