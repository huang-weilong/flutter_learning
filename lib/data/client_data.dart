import '../model/model.dart';
import '../database/database_helper.dart';

class ClientData {
  static final ClientData _instance = ClientData();

  static ClientData get instance => _instance;

/////////////////////////////////////////////////////////////
  List<Student> studentList = [];
  Student student;

  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<void> getStudent(String id) async {
    student = await databaseHelper.getStudent(id);
  }

  Future<void> loadStudentList() async {
    studentList = await databaseHelper.getStudentList();
  }
}
