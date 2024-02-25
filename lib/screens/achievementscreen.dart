import 'package:flutter/material.dart';

class AchievementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Achievementscreen'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Noura Brown',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildAchievementItem('2nd', Icons.cake, '150'),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _buildAchievementCard(
                'New Achievement!',
                'Bravo! You\'ve completed a 30-day Mindfulness Streak 🧘‍♀️. Reward: 5 Stars.',
                true),
            _buildAchievementCard(
                'Achievement Celebrated',
                'Congratulations! You\'ve finished your first Wellness Activity. Here\'s to many more! Reward: 2 Stars',
                false),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementItem(String place, IconData icon, String score) {
    return Column(
      children: <Widget>[
        Icon(icon, size: 30, color: Colors.amber),
        const SizedBox(height: 4),
        Text(
          place,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          score,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildAchievementCard(String title, String content, bool isClaimable) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            isClaimable
                ? ElevatedButton(
                    onPressed: () {
                      // Claim logic here
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // foreground
                    ),
                    child: const Text('Claim'),
                  )
                : TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey, // Text color
                    ),
                    child: const Text('Claimed'),
                  ),
          ],
        ),
      ),
    );
  }
}
