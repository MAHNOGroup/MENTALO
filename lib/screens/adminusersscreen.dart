// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminUsersScreen extends StatefulWidget {
  const AdminUsersScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminUsersScreenState createState() => _AdminUsersScreenState();
}

class _AdminUsersScreenState extends State<AdminUsersScreen> {
  // Mock data -   replace with your data source
  final List<Map<String, dynamic>> users = [
    {'name': 'John Doe', 'role': 'Admin'},
    {'name': 'Jane Doe', 'role': 'User'},
    {'name': 'Alice Johnson', 'role': 'User'},
    {'name': 'Bob Smith', 'role': 'Admin'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users and Roles'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            // ignore: prefer_const_constructors
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(users[index]['role'] == 'Admin'
                  ? Icons.security
                  : Icons.person),
              title: Text(users[index]['name']),
              subtitle: Text('Role: ${users[index]['role']}'),
              // Optionally, add an onTap to do something when the user taps on a list item
              onTap: () {
                // For example, navigate to a user detail or edit screen
              },
            ),
          );
        },
      ),
    );
  }
}
