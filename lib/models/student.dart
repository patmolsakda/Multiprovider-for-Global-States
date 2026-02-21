class Student {
  final String id;
  String name;
  String email;
  String major;
  int age;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.major,
    required this.age,
  });

  Student copyWith({
    String? id,
    String? name,
    String? email,
    String? major,
    int? age,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      major: major ?? this.major,
      age: age ?? this.age,
    );
  }

  @override
  String toString() =>
      'Student(id: $id, name: $name, email: $email, major: $major, age: $age)';
}