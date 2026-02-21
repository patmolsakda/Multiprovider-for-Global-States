import 'package:flutter/material.dart';
import '../../models/student.dart';

class StudentForm extends StatefulWidget {
  final Student? student; // null = add mode, non-null = edit mode
  final void Function(String name, String email, String major, int age)
      onSubmit;

  const StudentForm({super.key, this.student, required this.onSubmit});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _majorCtrl;
  late final TextEditingController _ageCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController(text: widget.student?.name ?? '');
    _emailCtrl = TextEditingController(text: widget.student?.email ?? '');
    _majorCtrl = TextEditingController(text: widget.student?.major ?? '');
    _ageCtrl =
        TextEditingController(text: widget.student?.age.toString() ?? '');
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _majorCtrl.dispose();
    _ageCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSubmit(
      _nameCtrl.text.trim(),
      _emailCtrl.text.trim(),
      _majorCtrl.text.trim(),
      int.parse(_ageCtrl.text.trim()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.student != null;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              isEdit ? 'Edit Student' : 'Add Student',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.isEmpty ? 'Name is required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _emailCtrl,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Email is required';
                if (!v.contains('@')) return 'Enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _majorCtrl,
              decoration: const InputDecoration(
                labelText: 'Major',
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(),
              ),
              validator: (v) =>
                  v == null || v.isEmpty ? 'Major is required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _ageCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(),
              ),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Age is required';
                final age = int.tryParse(v);
                if (age == null || age < 15 || age > 60) {
                  return 'Enter a valid age (15–60)';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _submit,
              icon: Icon(isEdit ? Icons.save : Icons.add),
              label: Text(isEdit ? 'Save Changes' : 'Add Student'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}