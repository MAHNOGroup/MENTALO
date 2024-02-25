import 'package:flutter/material.dart';

class FinalPreferencesScreen extends StatefulWidget {
  @override
  _FinalPreferencesScreenState createState() => _FinalPreferencesScreenState();
}

class _FinalPreferencesScreenState extends State<FinalPreferencesScreen> {
  final List<Map<String, dynamic>> _contentTypes = [
    {'type': 'Text', 'icon': 'images/Document.png'},
    {'type': 'Video', 'icon': 'images/Camera.png'},
    {'type': 'Audio', 'icon': 'images/Audio.png'},
    {'type': 'Interactive', 'icon': 'images/Read.png'},
  ];
  String _selectedType = '';

  Widget _buildContentTypeOption(Map<String, dynamic> contentType) {
    bool isSelected = _selectedType == contentType['type'];
    return ListTile(
      title: Text(contentType['type']),
      leading: Image.asset(contentType['icon'], width: 24, height: 24),
      onTap: () {
        setState(() {
          _selectedType = contentType['type'];
        });
      },
      tileColor: isSelected ? Colors.green.withOpacity(0.2) : null,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Touches'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Choose the types of content you prefer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            ..._contentTypes
                .map((contentType) => _buildContentTypeOption(contentType))
                .toList(),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement finish action
              },
              child: Text('Finish'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
