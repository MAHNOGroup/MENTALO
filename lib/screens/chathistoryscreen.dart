import 'package:flutter/material.dart';

class ChatHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat History'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Chats'),
              Tab(text: 'Deleted'),
              Tab(text: 'Favorite'),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop(); // Handle back arrow action
            },
          ),
        ),
        body: TabBarView(
          children: [
            _buildChatList(),
            Container(), // Placeholder for 'Deleted' tab content
            Container(), // Placeholder for 'Favorite' tab content
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    // Placeholder for chat data. Replace with your data source.
    final List<Map<String, String>> chats = [
      {
        'title': 'Morning Check-in: How did you sleep last night?',
        'subtitle': 'You mentioned having trouble sleeping...',
        'time': 'Last checked in at 8:05 AM Today'
      },
      {
        'title': 'Stress Relief Tips',
        'subtitle':
            'Let\'s try a 10-minute meditation to help you unwind after your workday',
        'time': 'Last viewed Monday at 1:20 PM'
      },
      // Add more chat items here
    ];

    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(chats[index]['title']!),
          subtitle: Text(chats[index]['subtitle']!),
          trailing: Icon(Icons.more_vert),
          leading: Icon(Icons.chat_bubble_outline),
          onTap: () {
            // Handle chat item tap
          },
        );
      },
    );
  }
}
