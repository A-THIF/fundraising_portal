import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xFFB22222), // Firebrick
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events),
          label: 'Leaderboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.campaign),
          label: 'Announcements',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
// This widget provides a custom bottom navigation bar with four items:
// Dashboard, Leaderboard, Announcements, and Profile.  