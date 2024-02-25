import 'package:flutter/material.dart';

class CommunityDeleteConversationScreen extends StatelessWidget {
  const CommunityDeleteConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Delete this conversation?'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
              'assets/delete_conversation_illustration.png'), // Your image asset
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Delete this conversation?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'You have the option to restore this conversation within 30 days.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.delete),
              label: const Text('Delete Conversation'),
              onPressed: () {
                // Handle delete action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red, // Button text color
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the screen
              },
              child: const Text('Cancel'),
            ),
          ),
        ],
      ),
    );
  }
}
