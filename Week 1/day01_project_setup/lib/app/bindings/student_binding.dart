import 'package:day01_project_setup/app/controller/student_controller.dart';
import 'package:get/get.dart';

class StudentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentController>(() => StudentController());
  }
}
