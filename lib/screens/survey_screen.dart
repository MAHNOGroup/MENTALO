import 'package:client/screens/home_page.dart';
import 'package:client/screens/survey_question.dart';
import 'package:flutter/material.dart';

class SurveyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the SurveyQuestionScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SurveyQuestion()),
                );
              },
              child: Text('Begin Survey'),
            ),
            TextButton(
              onPressed: () {
                // Navigate to the HomeScreen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          username:
                              'User')), // Replace 'User' with the actual username if needed
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Skip for Now'),
            ),
          ],
        ),
      ),
    );
  }
}
