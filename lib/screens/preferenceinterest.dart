import 'package:flutter/material.dart';

class PreferencesInterestsScreen extends StatefulWidget {
  @override
  _PreferencesInterestsScreenState createState() =>
      _PreferencesInterestsScreenState();
}

class _PreferencesInterestsScreenState
    extends State<PreferencesInterestsScreen> {
  final List<Map<String, dynamic>> _interests = [
    {'title': 'Mindfulness', 'icon': 'images/MakeDecision.png'},
    {'title': 'Fitness', 'icon': 'images/Dumbbell.png'},
    {'title': 'Nutrition', 'icon': 'images/Eating.png'},
    {'title': 'Learning', 'icon': 'images/Reading.png'},
  ];
  final Map<String, bool> _selectedInterests = {
    'Mindfulness': false,
    'Fitness': false,
    'Nutrition': false,
    'Learning': false,
    'Other': false,
  };
  final TextEditingController _otherController = TextEditingController();

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  Widget _buildInterestOption(String interest, String iconPath) {
    bool isSelected = _selectedInterests[interest]!;
    return ListTile(
      title: Text(interest),
      leading: Image.asset(iconPath, width: 36, height: 36),
      onTap: () {
        setState(() {
          _selectedInterests[interest] = !isSelected;
          if (interest != 'Other') {
            _otherController.clear();
            _selectedInterests['Other'] = false;
          }
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
        title: Text('Preferences & Interests'),
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
            Text(
              'Your Interests',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Tell us what interests you to enhance your recommendations',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 24),
            ..._interests.map((interestData) {
              return _buildInterestOption(
                  interestData['title'], interestData['icon']);
            }).toList(),
            ListTile(
              title: TextField(
                controller: _otherController,
                decoration: InputDecoration(
                  hintText: 'Other? (Click to write)',
                  border: OutlineInputBorder(),
                ),
                onTap: () {
                  setState(() {
                    _interests.forEach((interestData) {
                      _selectedInterests[interestData['title']] = false;
                    });
                    _selectedInterests['Other'] = true;
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
