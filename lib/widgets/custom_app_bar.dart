import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'She ',
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            TextSpan(
              text: 'Can!',
              style: GoogleFonts.satisfy(color: Colors.black, fontSize: 22),
            ),
            TextSpan(
              text: ' Foundation',
              style: GoogleFonts.roboto(
                color: Color(0xFFB22222),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/notifications',
            ); // Navigate to the notification screen
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
