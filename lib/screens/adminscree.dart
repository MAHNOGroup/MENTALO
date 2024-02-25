import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: <Widget>[
          AdminOptionCard(
            icon: Icons.people,
            title: 'User Management',
            onTap: () {
              // TODO: Navigate to user management
            },
          ),
          AdminOptionCard(
            icon: Icons.bar_chart,
            title: 'Reports',
            onTap: () {
              // TODO: Navigate to reports
            },
          ),
          AdminOptionCard(
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              // TODO: Navigate to settings
            },
          ),
          AdminOptionCard(
            icon: Icons.support,
            title: 'Support',
            onTap: () {
              // TODO: Navigate to support
            },
          ),
        ],
      ),
    );
  }
}

class AdminOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AdminOptionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.teal.withAlpha(30),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(icon, size: 70, color: Colors.teal),
              Text(title, style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
