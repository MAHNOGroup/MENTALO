import 'package:client/screens/adminsurveydetail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:client/screens/createsurveyscreen.dart';

class AdminSurveysScreen extends StatefulWidget {
  @override
  _AdminSurveysScreenState createState() => _AdminSurveysScreenState();
}

class _AdminSurveysScreenState extends State<AdminSurveysScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> _loadSurveys() {
    return _firestore.collection('surveys').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        var questions = List.from(doc.get('questions'))
            .map((q) => q['question'].toString())
            .join(', ');
        return {
          'id': doc.id, // Include the document ID
          'title': doc.get('title'),
          'description': questions,
        };
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Surveys and Forms'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _loadSurveys(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading surveys'));
          }

          final surveys = snapshot.data ?? [];

          return ListView.builder(
            itemCount: surveys.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(surveys[index]['title']),
                  subtitle: Text(surveys[index]['description']),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SurveyDetailsScreen(
                            surveyId: surveys[index][
                                'id']), // Assuming you have the survey ID in your data
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the CreateSurveyScreen when the button is tapped
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CreateSurveyScreen()),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Survey/Form',
      ),
    );
  }
}
