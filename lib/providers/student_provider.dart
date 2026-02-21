import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../models/student.dart';

class StudentProvider extends ChangeNotifier {
  final List<Student> _students = [
    Student(
      id: '1',
      name: 'Pat Molsakda',
      email: 'molsakdapat@gmail.com',
      major: 'Computer Science',
      age: 20,
    ),
    Student(
      id: '2',
      name: 'Bob Johnson',
      email: 'bob@example.com',
      major: 'Mathematics',
      age: 22,
    ),
    Student(
      id: '3',
      name: 'Carol White',
      email: 'carol@example.com',
      major: 'Physics',
      age: 21,
    ),
  ];

  final _uuid = const Uuid();

  List<Student> get students => List.unmodifiable(_students);

  int get totalStudents => _students.length;

  // CREATE
  void addStudent({
    required String name,
    required String email,
    required String major,
    required int age,
  }) {
    final student = Student(
      id: _uuid.v4(),
      name: name,
      email: email,
      major: major,
      age: age,
    );
    _students.add(student);
    notifyListeners();
  }

  // READ (single)
  Student? getStudentById(String id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }

  // UPDATE
  void updateStudent({
    required String id,
    required String name,
    required String email,
    required String major,
    required int age,
  }) {
    final index = _students.indexWhere((s) => s.id == id);
    if (index != -1) {
      _students[index] = _students[index].copyWith(
        name: name,
        email: email,
        major: major,
        age: age,
      );
      notifyListeners();
    }
  }

  // DELETE
  void deleteStudent(String id) {
    _students.removeWhere((s) => s.id == id);
    notifyListeners();
  }

  // SEARCH
  List<Student> searchStudents(String query) {
    if (query.isEmpty) return students;
    final lower = query.toLowerCase();
    return _students
        .where((s) =>
            s.name.toLowerCase().contains(lower) ||
            s.email.toLowerCase().contains(lower) ||
            s.major.toLowerCase().contains(lower))
        .toList();
  }
}
