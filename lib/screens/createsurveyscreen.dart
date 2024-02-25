import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateSurveyScreen extends StatefulWidget {
  const CreateSurveyScreen({Key? key}) : super(key: key);

  @override
  _CreateSurveyScreenState createState() => _CreateSurveyScreenState();
}

class _CreateSurveyScreenState extends State<CreateSurveyScreen> {
  final _formKey = GlobalKey<FormState>();
  String _surveyTitle = '';
  List<Map<String, dynamic>> _questionsAndAnswers = [];
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _addQuestion() {
    if (_questionController.text.isNotEmpty &&
        _answerController.text.isNotEmpty) {
      setState(() {
        _questionsAndAnswers.add({
          "question": _questionController.text,
          "answers": _answerController.text.split(';'), // Split answers by ';'
        });
        _questionController.clear();
        _answerController.clear();
      });
    }
  }

  Future<void> _submitSurvey() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Adding survey to Firestore
      try {
        final CollectionReference surveys = _firestore.collection('surveys');
        await surveys.add({
          'title': _surveyTitle,
          'questions': _questionsAndAnswers,
        });
        print('Survey added to Firestore successfully.');

        // Reset form after submission
        setState(() {
          _questionsAndAnswers.clear();
        });
        _formKey.currentState!.reset();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Survey submitted successfully')),
        );
      } catch (e) {
        print(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add survey: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Survey'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Survey Title'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a survey title' : null,
                onSaved: (value) => _surveyTitle = value!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _questionController,
                decoration: const InputDecoration(labelText: 'Question'),
              ),
              TextFormField(
                controller: _answerController,
                decoration: const InputDecoration(
                  labelText: 'Answers (separate with ";")',
                ),
              ),
              ElevatedButton(
                onPressed: _addQuestion,
                child: const Text('Add Question and Answers'),
              ),
              ..._questionsAndAnswers.map((qna) => ListTile(
                    title: Text(qna["question"]),
                    subtitle: Text((qna["answers"] as List).join(', ')),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          _questionsAndAnswers.remove(qna);
                        });
                      },
                    ),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitSurvey,
                child: const Text('Submit Survey'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
