import 'package:flutter/material.dart';

class MentaloChatbotScreen extends StatefulWidget {
  @override
  _MentaloChatbotScreenState createState() => _MentaloChatbotScreenState();
}

class _MentaloChatbotScreenState extends State<MentaloChatbotScreen> {
  // This variable determines whether there are stored conversations or not
  // You would typically get this from your app's logic or data source
  bool hasConversation = false; // Set this based on stored conversations

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Mentalo Chatbot'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasConversation
                ? Image.asset('images/BrainWelcome.png')
                : Image.asset('images/Brain.png'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                hasConversation
                    ? 'Continue our chat or start a new conversation.'
                    : "Let's talk! Start our first chat by tapping the button below.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
            if (!hasConversation)
              ElevatedButton.icon(
                icon: Icon(Icons.add),
                label: Text('New Conversation'),
                onPressed: () {
                  // Logic to start a new conversation
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            if (hasConversation)
              ElevatedButton(
                onPressed: () {
                  // Logic to continue the conversation
                },
                child: Text('Continue'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
            if (hasConversation)
              TextButton.icon(
                icon: Icon(Icons.add),
                label: Text('New Conversation'),
                onPressed: () {
                  // Logic to start a new conversation
                },
                style: TextButton.styleFrom(
                  primary: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
