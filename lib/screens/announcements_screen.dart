import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

class AnnouncementsScreen extends StatelessWidget {
  const AnnouncementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Announcements & Initiatives',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 24),

            // Initiatives
            const Text(
              'Our Focus Areas:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 12),

            _buildCard(
              icon: Icons.woman,
              title: 'Women\'s Empowerment',
              description:
                  'Empowering women with education, training, and resources to help them reach their full potential.',
            ),
            _buildCard(
              icon: Icons.school,
              title: 'Education & Skill-Building',
              description:
                  'Scholarships and vocational training to uplift women and girls.',
            ),
            _buildCard(
              icon: Icons.health_and_safety,
              title: 'Healthcare & Well-being',
              description:
                  'Promoting menstrual hygiene awareness and health initiatives in rural and slum areas.',
            ),
            _buildCard(
              icon: Icons.people,
              title: 'Community Support',
              description:
                  'Providing essentials and food to underprivileged and elderly women.',
            ),
            _buildCard(
              icon: Icons.campaign,
              title: 'Advocacy & Awareness',
              description:
                  'Campaigns and initiatives to raise awareness about women\'s issues.',
            ),
            _buildCard(
              icon: Icons.public,
              title: 'Global Reach',
              description:
                  'Supporting women globally through local partnerships.',
            ),

            const SizedBox(height: 32),

            // Recent Announcement
            const Text(
              'Recent Announcement:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 12),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SheCan DoMore 6.0 Conference 2025',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '📌 Panelist: Sola Adesakin, Wealth Coach\n📌 Speaker: Bishop Funke Felix-Adejumo\n📌 Special Guest: Nike Adeyemi\n\n📍 Balmoral (Federal Palace Hotel and Casino), Victoria Island, Lagos\n📅 July 18, 2025\n🕗 8 AM\n💡 Admission: Free (Registration required)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Call to Action
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: 'Join Us',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Join feature coming soon!'),
                      backgroundColor: Color(0xFFB22222),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFB22222)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
