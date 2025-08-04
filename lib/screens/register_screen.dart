import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _referralController = TextEditingController();

  Future<void> _register() async {
    if (_referralController.text.trim() != 'athif2005') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid referral code. Please use athif2005.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('userName', _nameController.text.trim());
    await prefs.setString('userEmail', _emailController.text.trim());
    await prefs.setString(
      'userPhone',
      _phoneController.text.trim(),
    ); // ✅ Added!

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text(
                'Create an Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB22222),
                ),
              ),
              const SizedBox(height: 32),

              // ✅ Name
              CustomTextField(label: 'Name', controller: _nameController),
              const SizedBox(height: 16),

              // ✅ Phone
              CustomTextField(
                label: 'Phone Number',
                controller: _phoneController,
                inputType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              // ✅ Email
              CustomTextField(
                label: 'Email',
                controller: _emailController,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // ✅ Password
              CustomTextField(
                label: 'Password',
                controller: _passwordController,
                isPassword: true,
              ),
              const SizedBox(height: 16),

              // ✅ Referral Code
              CustomTextField(
                label: 'Referral Code',
                controller: _referralController,
              ),
              const SizedBox(height: 32),

              // ✅ Register Button
              PrimaryButton(text: 'Register', onPressed: _register),
              const SizedBox(height: 16),

              // Already have account?
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Already have an account? Sign In",
                  style: TextStyle(color: Color(0xFFB22222)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
