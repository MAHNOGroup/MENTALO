import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final List<String> feedbackOptions = [
    'Performance',
    'Slow Response',
    'Navigation',
    'Loading',
    'Bug',
    'UI/UX'
  ];
  String? selectedFeedback; // Make it nullable
  bool agreeToContact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Feedback'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.sentiment_satisfied, size: 48, color: Colors.amber),
            SizedBox(height: 24),
            Text(
              'Which area you think needs improvement?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: feedbackOptions
                  .map((option) => ChoiceChip(
                        label: Text(option),
                        selected: selectedFeedback == option,
                        onSelected: (bool selected) {
                          setState(() {
                            selectedFeedback = (selected ? option : null)!;
                          });
                        },
                      ))
                  .toList(),
            ),
            SizedBox(height: 24),
            CheckboxListTile(
              title: Text(
                  "I agree to be contacted for follow-up questions (optional)"),
              value: agreeToContact,
              onChanged: (bool? newValue) {
                setState(() {
                  agreeToContact = newValue ?? false;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, // Align checkbox to the left
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text('Submit Feedback'),
              onPressed: () {
                // Submit feedback action
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Set the button's size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
