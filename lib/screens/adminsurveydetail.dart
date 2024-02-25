import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SurveyDetailsScreen extends StatefulWidget {
  final String surveyId;

  const SurveyDetailsScreen({Key? key, required this.surveyId})
      : super(key: key);

  @override
  _SurveyDetailsScreenState createState() => _SurveyDetailsScreenState();
}

class _SurveyDetailsScreenState extends State<SurveyDetailsScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _editQuestion(BuildContext context,
      Map<String, dynamic> question, int questionIndex) async {
    final TextEditingController questionController =
        TextEditingController(text: question['question']);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Question'),
          content: TextField(
            controller: questionController,
            decoration: const InputDecoration(hintText: "Enter new question"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Update'),
              onPressed: () async {
                final String editedQuestionText = questionController.text;

                // Fetch current survey data
                final DocumentSnapshot surveySnapshot = await _firestore
                    .collection('surveys')
                    .doc(widget.surveyId)
                    .get();
                final Map<String, dynamic> surveyData =
                    surveySnapshot.data() as Map<String, dynamic>;
                final List<dynamic> questions = surveyData['questions'];

                // Update the question in the list
                questions[questionIndex]['question'] = editedQuestionText;

                // Update Firestore with the new questions list
                await _firestore
                    .collection('surveys')
                    .doc(widget.surveyId)
                    .update({
                  'questions': questions,
                });

                Navigator.of(context).pop();
                setState(() {}); // Trigger a rebuild to reflect changes
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _editAnswer(BuildContext context, Map<String, dynamic> question,
      int questionIndex, int answerIndex) async {
    String currentAnswer = question['answers'][answerIndex];
    TextEditingController answerController =
        TextEditingController(text: currentAnswer);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Answer'),
          content: TextField(
            controller: answerController,
            decoration: InputDecoration(hintText: "Enter new answer"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                String editedAnswer = answerController.text;
                setState(() {
                  question['answers'][answerIndex] = editedAnswer;
                });

                // Fetch current survey data
                DocumentSnapshot surveySnapshot = await _firestore
                    .collection('surveys')
                    .doc(widget.surveyId)
                    .get();
                Map<String, dynamic> surveyData =
                    surveySnapshot.data() as Map<String, dynamic>;
                List<dynamic> questions = surveyData['questions'];

                // You might need to handle this update differently based on your Firestore structure
                questions[questionIndex]['answers'][answerIndex] = editedAnswer;

                // Push update to Firestore
                await _firestore
                    .collection('surveys')
                    .doc(widget.surveyId)
                    .update({
                  'questions': questions,
                });

                Navigator.of(context).pop();
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _deleteQuestion(String questionId) {
    // Implement your Firestore delete logic here
    print('Deleting question $questionId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey Details'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _firestore.collection('surveys').doc(widget.surveyId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            List<dynamic> questions = data['questions'];

            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> question = questions[index];
                return ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(question['question'])),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editQuestion(
                            context, question, index), // Corrected
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _deleteQuestion(question['id'].toString()),
                      ),
                    ],
                  ),
                  children: List<Widget>.from(
                    question['answers'].asMap().entries.map(
                      (entry) {
                        int answerIndex = entry.key;
                        String answer = entry.value;
                        return ListTile(
                          title: Text(answer),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _editAnswer(
                                    context, question, index, answerIndex),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Implement delete logic for the answer
                                  setState(() {
                                    question['answers'].removeAt(answerIndex);
                                    // Update Firestore with the new answers list
                                    // Similar to the update logic in _editAnswer
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
