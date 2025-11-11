import 'package:day01_project_setup/app/data/dao/students_dao.dart';
import 'package:day01_project_setup/app/data/models/students_model.dart';

class StudentRepository {
  final StudentsDAO _dao = StudentsDAO();

  ///Add Student
  Future<bool> addStudents(StudentsModel student) async {
    return await _dao.addStudent(student);
  }

  /// Get Students
  Future<List<StudentsModel>> getAllStudents() async {
    return await _dao.getAllStudents();
  }

  /// Delete Students
  Future<bool> deleteStudent(int id) async {
    return await _dao.deleteStudent(id);
  }

  /// Updated Students
  Future<bool> updateStudent(StudentsModel student) async {
    return await _dao.updateStudent(student);
  }
}
