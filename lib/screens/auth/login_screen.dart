import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => AuthService().signInAnonymously(context),
          child: const Text('Sign in Anonymously'),
        ),
      ),
    );
  }
}