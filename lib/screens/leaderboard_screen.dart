import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> topFundraisers = [
      {'name': 'Hamilton Track Dogs', 'amount': '\$3,214.23'},
      {'name': 'Team Shane', 'amount': '\$2,367.33'},
      {'name': 'DaveyLadies', 'amount': '\$872.69'},
      {'name': 'Fundraising Champs', 'amount': '\$745.50'},
      {'name': 'Women Empower Squad', 'amount': '\$689.00'},
      {'name': 'Charity Heroes', 'amount': '\$500.00'},
      {'name': 'Hope Bringers', 'amount': '\$450.00'},
      {'name': 'Change Makers', 'amount': '\$400.00'},
      {'name': 'Impact Crew', 'amount': '\$350.00'},
      {'name': 'Empower Leaders', 'amount': '\$300.00'},
    ];

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFFF8F8F8),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '🏆 Fundraising Leaderboard',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB22222),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: topFundraisers.length,
                itemBuilder: (context, index) {
                  final fundraiser = topFundraisers[index];
                  return _buildFundraiserCard(
                    fundraiser['name']!,
                    fundraiser['amount']!,
                    index + 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFundraiserCard(String name, String amount, int rank) {
    // Medal emoji
    String? medal;
    if (rank == 1) medal = '🥇';
    if (rank == 2) medal = '🥈';
    if (rank == 3) medal = '🥉';

    // Colors for top 3
    Color? bgColor;
    Color? borderColor;

    if (rank == 1) {
      bgColor = const Color(0xFFFFF4CC); // soft warm gold background
      borderColor = const Color(
        0xFFFFC107,
      ); // deep golden amber border (Material amber)
    } else if (rank == 2) {
      bgColor = const Color(0xFFF5F5F5); // light silver
      borderColor = const Color.fromARGB(255, 75, 74, 74); // silver border
    } else if (rank == 3) {
      bgColor = const Color(0xFFF5F5DC); // light bronze/beige
      borderColor = const Color(0xFFCD7F32); // bronze border
    }

    final bool isTop3 = rank <= 3;
    final bool isHighlighted = rank == 4 || rank == 5;

    return Card(
      elevation: 4,
      color: isTop3
          ? bgColor
          : isHighlighted
          ? const Color(0xFFFFE4E1)
          : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isTop3
            ? BorderSide(color: borderColor!, width: 2)
            : BorderSide.none,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Text(
          medal ?? '$rank',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isTop3 ? borderColor : Colors.grey[700],
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        trailing: Text(
          amount,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB22222),
          ),
        ),
      ),
    );
  }
}
