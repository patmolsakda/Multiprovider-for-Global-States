import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = '';
  String _role = '';

  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;
  String get role => _role;

  // Simulated login — replace with real auth logic
  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 800)); // simulate network
    if (username.isNotEmpty && password.length >= 4) {
      _isLoggedIn = true;
      _username = username;
      _role = username == 'admin' ? 'Admin' : 'Student';
      notifyListeners();
      return true;
    }
    return false;
  }

  void logout() {
    _isLoggedIn = false;
    _username = '';
    _role = '';
    notifyListeners();
  }
}