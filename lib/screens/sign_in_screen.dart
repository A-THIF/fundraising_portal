import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _signIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    if (!mounted) return; // ✅ SAFE
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 32),

            // ✅ Email
            CustomTextField(label: 'Email', controller: _emailController),
            const SizedBox(height: 16),

            // ✅ Password
            CustomTextField(
              label: 'Password',
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 32),

            // ✅ Sign In
            PrimaryButton(text: 'Sign In', onPressed: _signIn),
            const SizedBox(height: 16),

            // New user link
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text(
                "New user? Register here",
                style: TextStyle(color: Color(0xFFB22222)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
