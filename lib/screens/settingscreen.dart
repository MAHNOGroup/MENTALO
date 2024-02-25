import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button
          },
        ),
      ),
      body: ListView(
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            _buildListTile(
                title: 'Account Information',
                icon: Icons.arrow_forward_ios,
                subtitle: ''),
            _buildListTile(
                title: 'Accessibility Settings',
                icon: Icons.arrow_forward_ios,
                subtitle: ''),
            _buildSwitchTile(title: 'Theme', value: true),
            _buildListTile(
                title: 'Language',
                subtitle: 'English (EN)',
                icon: Icons.arrow_forward_ios),
            _buildSwitchTile(title: 'Pause Notifications', value: false),
            _buildListTile(
                title: 'Notification Settings',
                icon: Icons.arrow_forward_ios,
                subtitle: ''),
            _buildListTile(
                title: 'Submit Feedback',
                icon: Icons.arrow_forward_ios,
                subtitle: ''),
            _buildListTile(
                title: 'Terms of Use',
                icon: Icons.arrow_forward_ios,
                subtitle: ''),
            _buildListTile(
                title: 'Privacy Policy',
                icon: Icons.arrow_forward_ios,
                subtitle: ''),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ).toList(),
      ),
    );
  }

  ListTile _buildListTile(
      {required String title,
      required String subtitle,
      required IconData icon}) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing:
          icon != null ? Icon(icon, size: 16.0, color: Colors.black54) : null,
      onTap: () {
        // Handle tap
      },
    );
  }

  SwitchListTile _buildSwitchTile(
      {required String title, required bool value}) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (bool newValue) {
        // Handle switch toggle
      },
      secondary:
          Icon(value ? Icons.toggle_on : Icons.toggle_off, color: Colors.green),
    );
  }
}
