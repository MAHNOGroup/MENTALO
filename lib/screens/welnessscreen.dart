import 'package:flutter/material.dart';

class WellnessGoalsScreen extends StatefulWidget {
  @override
  _WellnessGoalsScreenState createState() => _WellnessGoalsScreenState();
}

class _WellnessGoalsScreenState extends State<WellnessGoalsScreen> {
  String selectedGoal = 'Improve Sleep';
  String selectedInterest = 'Nutrition';
  String selectedAvailability = '1 Hour';
  String selectedExperience = 'Advanced';
  String selectedContentType = 'Audio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WellnessGoalsScreen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          DropdownButtonFormField<String>(
            value: selectedGoal,
            items: ['Improve Sleep', 'Boost Mood', 'Reduce Stress']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedGoal = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Your Goals',
              icon: Icon(Icons.bedtime),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedInterest,
            items: ['Nutrition', 'Exercise', 'Well-being']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedInterest = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Your Interests',
              icon: Icon(Icons.interests),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedAvailability,
            items: ['1 Hour', '30 Minutes', '2 Hours']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedAvailability = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Your Availability',
              icon: Icon(Icons.schedule),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedExperience,
            items: ['Beginner', 'Intermediate', 'Advanced']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedExperience = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Your Experience',
              icon: Icon(Icons.explore),
            ),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: selectedContentType,
            items: ['Audio', 'Video', 'Text']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedContentType = newValue!;
              });
            },
            decoration: InputDecoration(
              labelText: 'Type of Content You Prefer',
              icon: Icon(Icons.content_paste),
            ),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              // Implement save functionality
            },
            child: Text('Save Changes'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
