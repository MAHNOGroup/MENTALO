import 'package:client/screens/activityhistoryscreen.dart';
import 'package:client/screens/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:client/screens/achievementscreen.dart'; // Make sure this import is correct
import 'package:client/screens/editprofile.dart'; // Make sure this import is correct

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Replace with your actual image URL
            ),
            const SizedBox(height: 10),
            const Text(
              'Noura Brown',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => EditProfileScreen()),
                );
              },
              child: const Text('Edit Profile'),
              style: TextButton.styleFrom(
                primary: Colors.green, // Text color
              ),
            ),
            _buildListItem('Activity History', Icons.history, context,
                onTap: () {
              // Navigate to the ActivityHistoryScreen
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => ActivityHistoryScreen()),
              );
            }),
            _buildListItem('Achievements', Icons.star, context, onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => AchievementScreen()),
              );
            }),
            _buildListItem('Wellness Goals', Icons.flag, context, onTap: () {
              // Implement navigation for Wellness Goals
            }),
            _buildListItem(
              'Settings',
              Icons.settings,
              context,
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SettingsScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon, BuildContext context,
      {VoidCallback? onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right, color: Colors.green),
        onTap: onTap, // Pass the onTap callback here
      ),
    );
  }
}
