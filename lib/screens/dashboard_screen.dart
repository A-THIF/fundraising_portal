import 'package:flutter/material.dart';

import '../widgets/primary_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF8F8F8),
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            const Text(
              'Dashboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 24),

            // Total Donation Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.volunteer_activism,
                  color: Color(0xFFB22222),
                ),
                title: const Text(
                  'Total Donations Raised',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  '₹ 5,00,000',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // User Donation Card
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.account_balance_wallet,
                  color: Color(0xFFB22222),
                ),
                title: const Text(
                  'Your Contribution',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('₹ 5,000', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 16),

            // Referral Code
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.qr_code, color: Color(0xFFB22222)),
                title: Text(
                  'Your Referral Code',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('athif2005', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 32),

            // Fundraising Context
            const Text(
              'About She Can! Foundation',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'The She Can! Foundation focuses on fundraising to empower women and girls by providing them with resources and opportunities for growth. They aim to create a more equitable society by addressing issues like limited access to education, healthcare, and economic opportunities.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            const Text(
              'Donations help fund scholarships, vocational training, and outreach programs. The foundation ensures transparency and is registered under the Indian Society Registration Act of 1860.',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 32),

            // Donate More Button
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                text: 'Donate More',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Donate feature coming soon!'),
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
}
