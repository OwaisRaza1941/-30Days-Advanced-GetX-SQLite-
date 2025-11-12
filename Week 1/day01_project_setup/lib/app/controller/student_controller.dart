import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:day01_project_setup/app/repository/student_repository.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final StudentRepository _repository = StudentRepository();

  RxList<StudentsModel> studentsList = <StudentsModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;

  /// Add Students
  Future<void> addStudents(StudentsModel student) async {
    try {
      isSaving.value = true;
      final success = await _repository.addStudents(student);

      if (success) {
        await getAllStudents();
        await Future.delayed(Duration(seconds: 2));
        Get.snackbar('Success', 'Students Added');
      } else {
        Get.snackbar('Error', 'Failed to add student');
      }
    } catch (e) {
      print('addStudent error: $e');
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isSaving.value = false;
    }
  }

  /// Get All Students
  Future<void> getAllStudents() async {
    try {
      isLoading.value = true;
      final data = await _repository.getAllStudents();
      await Future.delayed(Duration(seconds: 2));
      studentsList.assignAll(data);
    } catch (e) {
      print('fetchAll error: $e');
      Get.snackbar('Error', 'Failed to load students');
    } finally {
      isLoading.value = false;
    }
  }

  /// Upadated Students
  Future<void> updatedStudents(StudentsModel student) async {
    try {
      isSaving.value = true;
      final success = await _repository.updateStudent(student);
      if (success) {
        await getAllStudents();
        await Future.delayed(Duration(seconds: 2));
        Get.snackbar('Success', 'Student Updated');
      } else {
        Get.snackbar('Error', 'Failed to add student');
      }
    } catch (e) {
      print('addStudent error: $e');
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isSaving.value = false;
    }
  }

  /// Delete Student
  Future<void> deleteStdudents(int id) async {
    try {
      isSaving.value = true;
      final success = await _repository.deleteStudent(id);
      if (success) {
        await getAllStudents();
        await Future.delayed(Duration(seconds: 2));
      } else {
        Get.snackbar(
          'Error',
          'Failed To Delete Student',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('addStudent error: $e');
      Get.snackbar('Error', 'Something went wrong');
    } finally {
      isSaving.value = false;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllStudents();
  }
}
