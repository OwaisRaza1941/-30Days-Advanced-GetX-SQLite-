import 'package:day01_project_setup/app/data/local/db_helper.dart';

class StudentsModel {
  int? id;
  String? name;
  int? age;
  String? email;

  StudentsModel({this.id, this.name, this.age, this.email});

  /// JSON Covert to (DART Model Class)
  factory StudentsModel.fromMap(Map<String, dynamic> map) {
    return StudentsModel(
      id: map[DBKeys.colId],
      name: map[DBKeys.colName],
      age: map[DBKeys.colAge],
      email: map[DBKeys.colEmail],
    );
  }

  /// DART Model Convert to (JSON STRUCTURE)
  Map<String, dynamic> toMap() {
    return {
      DBKeys.colId: id,
      DBKeys.colName: name,
      DBKeys.colAge: age,
      DBKeys.colEmail: email,
    };
  }
}
