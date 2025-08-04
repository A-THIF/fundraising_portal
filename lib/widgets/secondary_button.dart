import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFB22222),
        side: const BorderSide(color: Color(0xFFB22222)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
