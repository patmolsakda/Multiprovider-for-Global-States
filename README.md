# 📚 Student Management App — MultiProvider Lab

A Flutter app demonstrating **MultiProvider** for managing 3 independent global states.

---

## 📁 Project Structure

```
lib/
├── main.dart                      ← MultiProvider setup + MaterialApp
├── models/
│   └── student.dart               ← Student data model
├── providers/
│   ├── auth_provider.dart         ← 1️⃣  Auth State (login/logout)
│   ├── student_provider.dart      ← 2️⃣  Student State (CRUD)
│   └── theme_provider.dart        ← 3️⃣  Theme State (dark/light)
├── screens/
│   ├── login_screen.dart          ← Login UI
│   └── home_screen.dart           ← Main screen with student list
└── widgets/
    ├── student_card.dart          ← Reusable student card
    └── student_form.dart          ← Add/Edit form (bottom sheet)
```

---

## 🌐 Global States

| # | Provider | Responsibility |
|---|----------|---------------|
| 1 | `AuthProvider` | Login / Logout, username, role |
| 2 | `StudentProvider` | CRUD operations + search |
| 3 | `ThemeProvider` | Dark / Light mode toggle |

---

## 🚀 Getting Started

```bash
flutter pub get
flutter run
```

---

## 🔑 Key Concepts

### MultiProvider in `main.dart`
```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => StudentProvider()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
  ],
  child: const MyApp(),
)
```

### Reading a Provider
```dart
// Watch (rebuilds widget on change)
final auth = context.watch<AuthProvider>();

// Read (one-time, no rebuild)
context.read<StudentProvider>().addStudent(...);
```

### Student CRUD
```dart
studentProvider.addStudent(name, email, major, age);   // Create
studentProvider.students;                               // Read (all)
studentProvider.getStudentById(id);                    // Read (one)
studentProvider.updateStudent(id, name, ...);          // Update
studentProvider.deleteStudent(id);                     // Delete
studentProvider.searchStudents(query);                 // Search
```
## 📄 License

This project is free to use for learning and development purposes.

---

⭐ Developed using Flutter by **Pat Molsakda**
If you like this project, feel free to give it a star on GitHub! 
