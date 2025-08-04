import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  String phone = '';
  String bio = '';
  String bankName = '';
  String accountNumber = '';
  String ifsc = '';

  final _bioController = TextEditingController();
  final _bankNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final _ifscController = TextEditingController();

  bool _isEditing = false; // ✅ toggle for editing mode

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('userName') ?? 'Your Name';
      email = prefs.getString('userEmail') ?? 'your@email.com';
      phone = prefs.getString('userPhone') ?? '1234567890';
      bio = prefs.getString('userBio') ?? '';
      bankName = prefs.getString('bankName') ?? '';
      accountNumber = prefs.getString('accountNumber') ?? '';
      ifsc = prefs.getString('ifsc') ?? '';

      _bioController.text = bio;
      _bankNameController.text = bankName;
      _accountNumberController.text = accountNumber;
      _ifscController.text = ifsc;
    });
  }

  Future<void> _saveProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userBio', _bioController.text.trim());
    await prefs.setString('bankName', _bankNameController.text.trim());
    await prefs.setString(
      'accountNumber',
      _accountNumberController.text.trim(),
    );
    await prefs.setString('ifsc', _ifscController.text.trim());

    if (!mounted) return;

    setState(() {
      _isEditing = false; // ✅ Turn off editing after saving
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile saved!'),
        backgroundColor: Color(0xFFB22222),
      ),
    );
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/sign_in');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 24),

            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profiles/default.png'),
            ),
            const SizedBox(height: 16),

            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(email, style: const TextStyle(fontSize: 16)),
            Text(phone, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            const Text(
              'Referral Code: athif2005',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xFFB22222),
              ),
            ),

            const SizedBox(height: 32),

            // Bio
            CustomTextField(
              controller: _bioController,
              label: 'Bio',
              maxLines: 3,
              enabled: _isEditing,
            ),
            const SizedBox(height: 16),

            // Bank Details
            CustomTextField(
              controller: _bankNameController,
              label: 'Bank Name',
              enabled: _isEditing,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              controller: _accountNumberController,
              label: 'Account Number',
              inputType: TextInputType.number,
              enabled: _isEditing,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              controller: _ifscController,
              label: 'IFSC Code',
              enabled: _isEditing,
            ),
            const SizedBox(height: 32),

            if (_isEditing)
              PrimaryButton(text: 'Save', onPressed: _saveProfile)
            else
              PrimaryButton(
                text: 'Edit Profile',
                onPressed: () {
                  setState(() {
                    _isEditing = true;
                  });
                },
              ),
            const SizedBox(height: 16),

            TextButton.icon(
              onPressed: _logout,
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
