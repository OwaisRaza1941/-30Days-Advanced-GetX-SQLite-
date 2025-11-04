import 'package:day01_project_setup/app/data/local/db_helper.dart';
import 'package:day01_project_setup/app/data/models/students_model.dart';

class StudentsDAO {
  final DBHelper _dbHelper = DBHelper.getInstance;

  /// Add student (wraps DBHelper private method)
  Future<bool> addStudent(StudentsModel student) async {
    try {
      final result = await _dbHelper.add(student);
      return result;
    } catch (e) {
      // optional: log error
      print("StudentDao.addStudent error: $e");
      return false;
    }
  }

  /// GET All Students
  Future<List<StudentsModel>> getAllStudents() async {
    try {
      final data = await _dbHelper.get();
      return data.map((e) => StudentsModel.fromMap(e)).toList();
    } catch (e) {
      print("StudentsDAO.getStudents Error: $e");
      return [];
    }
  }

  /// UPDATE Student
  Future<bool> updateStudent(StudentsModel student) async {
    try {
      return await _dbHelper.update(student);
    } catch (e) {
      print("StudentsDAO.updateStudent Error: $e");
      return false;
    }
  }

  /// DELETE Student
  Future<bool> deleteStudent(int id) async {
    try {
      return await _dbHelper.delete(id);
    } catch (e) {
      print("StudentsDAO.deleteStudent Error: $e");
      return false;
    }
  }
}
