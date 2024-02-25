import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Chat History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: const Text('Adam Smith'),
            subtitle: const Text('Fine! Thanks. How was your day?'),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Implement action for delete
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: const Text('Monica Sprouse'),
            subtitle: const Text('Hey there! Nice to meet you.'),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Implement action for delete
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: const Text('Emilia Waterson'),
            subtitle: const Text('Hello! I like your posts...'),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Implement action for delete
              },
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            title: const Text('Richard Waterson'),
            subtitle: const Text('You: Thank you for your help!'),
            trailing: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // Implement action for delete
              },
            ),
          ),
          // Add more ListTiles for other chat history items...
        ],
      ),
    );
  }
}
