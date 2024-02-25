import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [
    {
      "text": "Managing stress and anxiety can be approached in several ways. "
          "Practicing mindfulness, deep breathing exercises, and regular physical activity are great starting points. "
          "Also, establishing a routine, ensuring you get enough sleep, and connecting with friends and family can help. "
          "Would you like to try a guided relaxation activity, or learn more about these techniques?",
      "isBot": true
    },
    {
      "text": "Thank you for sharing that with me. "
          "Let's start with a short breathing exercise that can help calm your mind. "
          "We'll do the 4-7-8 technique: Breathe in for 4 seconds, hold for 7 seconds, and exhale slowly for 8 seconds. "
          "Do this cycle four times. Ready to start, or would you prefer a different activity?",
      "isBot": true
    },
    // Add more messages here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Mentalo Chatbot', style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final bool isBot = messages[index]['isBot'] as bool;
                return _buildMessageBubble(
                    messages[index]['text'] as String, isBot);
              },
            ),
          ),
          _buildUserInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isBot) {
    return Align(
      alignment: isBot ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: isBot ? Colors.grey.shade200 : Colors.red[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildUserInputArea() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 5, bottom: 10),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(24.0),
              ),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  icon:
                      Icon(Icons.sentiment_very_satisfied, color: Colors.grey),
                  hintText: "Type your message here...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.red.shade700),
            onPressed: () {
              if (_controller.text.trim().isNotEmpty) {
                setState(() {
                  messages.add({
                    "text": _controller.text,
                    "isBot": false,
                  });
                  _controller.clear();
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
