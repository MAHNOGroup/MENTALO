import 'package:flutter/material.dart';

class ExperienceLevelScreen extends StatefulWidget {
  @override
  _ExperienceLevelScreenState createState() => _ExperienceLevelScreenState();
}

class _ExperienceLevelScreenState extends State<ExperienceLevelScreen> {
  final List<String> _experienceLevels = [
    'Beginner',
    'Intermediate',
    'Advanced',
  ];
  String _selectedExperience = '';
  final TextEditingController _otherExperienceController =
      TextEditingController();

  @override
  void dispose() {
    _otherExperienceController.dispose();
    super.dispose();
  }

  Widget _buildExperienceOption(String level) {
    bool isSelected = _selectedExperience == level;
    return ListTile(
      title: Text(level),
      onTap: () {
        setState(() {
          _selectedExperience = level;
          // Clear the "Other" field when a predefined level is selected
          _otherExperienceController.clear();
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
        title: Text('Your Experience'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Handle info action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Image.asset('images/MakeDecision.png', width: 60, height: 60),
                  Text(
                    'Your Experience',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Do you have prior experience with mental wellness practices?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ..._experienceLevels
                .map((level) => _buildExperienceOption(level))
                .toList(),
            ListTile(
              title: TextField(
                controller: _otherExperienceController,
                decoration: InputDecoration(
                  hintText: 'Other? (Click to write)',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  setState(() {
                    _selectedExperience = 'Other';
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement continue action
              },
              child: Text('Continue'),
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
