import 'package:flutter/material.dart';

class CommunityProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Noura Brown',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          const Center(
            child: Text(
              '150 Following • 250 Followers',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'My Posts',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          _buildPostCard(
            title: 'Manage Stress',
            content:
                'Join me in exploring effective strategies to reduce stress and cultivate a calm mindset. Share tips, ask questions, and engage in activities that promote relaxation and mental clarity.',
          ),
          _buildPostCard(
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Whenever I need a boost',
            content: 'Revisiting these memories can be a great help.',
          ),
          // Repeat _buildPostCard for each post...
        ],
      ),
    );
  }

  Widget _buildPostCard({String? title, String? content, String? imageUrl}) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imageUrl != null)
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            if (title != null) ...[
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 4),
            ],
            if (content != null)
              Text(
                content,
                style: const TextStyle(fontSize: 16),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {}, // Replace with your own handler.
                ),
                const Text('125'),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {}, // Replace with your own handler.
                ),
                const Text('200'),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {}, // Replace with your own handler.
                ),
                const Text('104'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
