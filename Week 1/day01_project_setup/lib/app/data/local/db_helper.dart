import 'package:day01_project_setup/app/data/models/students_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBKeys {
  // Database name
  static const String dbName = "students.db";

  // Table name
  static const String studentTable = "students";

  // Columns
  static const String colId = "id";
  static const String colName = "name";
  static const String colAge = "age";
  static const String colEmail = "email";
}

class DBHelper {
  /// Singletone
  DBHelper._();

  static final DBHelper getInstance = DBHelper._();

  Database? _myDB;

  /// if exist path(then open else onCreate )
  Future<Database> _getDB() async {
    if (_myDB != null) {
      return _myDB!;
    } else {
      return await _openDB();
    }
  }

  //OPEN DB
  Future<Database> _openDB() async {
    String dbPath = join(await getDatabasesPath(), DBKeys.dbName);

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE ${DBKeys.studentTable} ('
          '${DBKeys.colId} INTEGER PRIMARY KEY AUTOINCREMENT, '
          '${DBKeys.colName} TEXT, '
          '${DBKeys.colAge} INTEGER, '
          '${DBKeys.colEmail} TEXT)',
        );
      },
    );
  }

  /// All Queries Here

  /// INSERTION
  Future<bool> add(StudentsModel student) async {
    final db = await _getDB();
    int rowsEffected = await db.insert(DBKeys.studentTable, student.toMap());

    return rowsEffected > 0;
  }

  /// GET ALL STUDENTS
  Future<List<Map<String, dynamic>>> get() async {
    final db = await _getDB();

    List<Map<String, dynamic>> mData = await db.query(DBKeys.studentTable);

    return mData;
  }

  /// UPDATED STUDENTS
  Future<bool> update(StudentsModel student) async {
    final db = await _getDB();

    int rowsEffected = await db.update(
      DBKeys.studentTable,
      student.toMap(),
      where: '${DBKeys.colId} = ?',
      whereArgs: [student.id],
    );

    return rowsEffected > 0;
  }

  ///DELETE STUDENTS
  Future<bool> delete(int id) async {
    final db = await _getDB();
    int rowsEffected = await db.delete(
      DBKeys.studentTable,
      where: '${DBKeys.colId} = $id',
    );
    return rowsEffected > 0;
  }
}
