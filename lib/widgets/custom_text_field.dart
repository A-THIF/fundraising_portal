import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType inputType;
  final int maxLines;
  final bool enabled; // ✅ new property

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.inputType = TextInputType.text,
    this.maxLines = 1, // ✅ default to 1 line if not set
    this.enabled = true, // ✅ default to enabled
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      maxLines: maxLines, // ✅ new
      enabled: enabled, // ✅ use the new property
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        floatingLabelStyle: TextStyle(color: Color(0xFFB22222)), // Firebrick,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFB22222),
            width: 2,
          ), // Firebrick
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 1),
        ),
      ),
    );
  }
}
