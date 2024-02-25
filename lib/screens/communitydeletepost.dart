import 'package:flutter/material.dart';

class CommunityDeletePostScreen extends StatelessWidget {
  const CommunityDeletePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Delete this Post?'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                  'assets/delete_post_illustration.png'), // Your image asset
              const SizedBox(height: 24),
              const Text(
                'Delete this Post?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Are you sure you want to delete this post?',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Yes, Delete Post'),
                onPressed: () {
                  // TODO: Handle delete post action
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red, // Button text color
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the screen
                },
                child: const Text('No, Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
