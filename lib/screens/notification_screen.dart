import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      '✅ You signed in successfully.',
      '💸 You paid ₹5,000.',
      '✅ Payment transaction completed.',
      '🎉 You have donated ₹5,000 to the She Can! Foundation.',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications, color: Color(0xFFB22222)),
            title: Text(
              notifications[index],
              style: const TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
