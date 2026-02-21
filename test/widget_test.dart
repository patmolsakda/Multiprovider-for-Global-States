// test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:student_management_app/main.dart';
import 'package:student_management_app/providers/auth_provider.dart';
import 'package:student_management_app/providers/student_provider.dart';
import 'package:student_management_app/providers/theme_provider.dart';

void main() {
  testWidgets('App renders LoginScreen when not logged in', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => StudentProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const MyApp(),
      ),
    );

    expect(find.text('Student Management'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}