import 'package:flutter/material.dart';

class CommunityGuidelinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Guidelines'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to the Mentalo Community!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "We're thrilled to have you join our supportive network of individuals dedicated to improving mental wellness. To maintain a safe and positive environment, please adhere to the following guidelines:",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              '• Be Respectful: Treat all members with respect and kindness. Personal attacks, harassment, and hate speech have no place here.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• Stay Relevant: Keep discussions on topic. Share content that is related to mental wellness and contributes constructively to the community.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• Protect Privacy: Respect everyone\'s privacy. Do not share personal information about yourself or others that isn\'t meant for public view.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• Avoid Self-Promotion: The community is a place for sharing and growth, not for advertising services or products.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• Enjoy the Journey: Engage, participate, and take advantage of the collective knowledge and experiences available here.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• Consequences: Violations of these guidelines may result in a warning, temporary mute, or, in severe cases, permanent ban from the community.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for helping us create a warm and welcoming space for all.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
