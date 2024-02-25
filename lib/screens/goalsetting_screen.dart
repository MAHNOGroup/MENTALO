import 'package:flutter/material.dart';

class GoalSettingScreen extends StatefulWidget {
  @override
  _GoalSettingScreenState createState() => _GoalSettingScreenState();
}

class _GoalSettingScreenState extends State<GoalSettingScreen> {
  final List<Map<String, dynamic>> _goals = [
    {'title': 'Reduce Stress', 'icon': 'images/Collapse.png'},
    {'title': 'Boost Mood', 'icon': 'images/GrinningFace.png'},
    {'title': 'Improve Sleep', 'icon': 'images/Sleeping.png'},
  ];
  final Map<String, bool> _selectedGoals = {
    'Reduce Stress': false,
    'Boost Mood': false,
    'Improve Sleep': false,
    'Other': false,
  };
  final TextEditingController _otherController = TextEditingController();

  @override
  void dispose() {
    _otherController.dispose();
    super.dispose();
  }

  Widget _buildGoalOption(String goal, String iconPath) {
    bool isSelected = _selectedGoals[goal]!;
    return ListTile(
      title: Text(goal),
      leading: Image.asset(iconPath, width: 24, height: 24),
      onTap: () {
        setState(() {
          _selectedGoals[goal] = !isSelected;
          if (goal != 'Other') {
            _otherController.clear();
            _selectedGoals['Other'] = false;
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
        title: Text('Goal Setting Screen'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Set Your Goals',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ..._goals.map((goalData) {
              return _buildGoalOption(goalData['title'], goalData['icon']);
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
                    for (var goal in _goals) {
                      _selectedGoals[goal['title']] = false;
                    }
                    _selectedGoals['Other'] = true;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
