import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Meditation'),
                  onDeleted: () {
                    // handle delete of chip
                  },
                ),
                Chip(
                  label: Text('Sleep'),
                  onDeleted: () {
                    // handle delete of chip
                  },
                ),
                Chip(
                  label: Text('Manage Stress'),
                  onDeleted: () {
                    // handle delete of chip
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
