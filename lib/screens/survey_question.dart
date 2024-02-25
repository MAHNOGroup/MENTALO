import 'package:flutter/material.dart';

class SurveyQuestion extends StatefulWidget {
  const SurveyQuestion({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyQuestion> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is your primary reason for using Mentalo?',
      'answers': [
        'Manage stress and anxiety',
        'Improve my mood and happiness',
        'Develop better sleep habits',
        'Learn more about mental wellness',
        'Find support within a community',
      ],
    },
    {
      'question': '1What is your primary reason for using Mentalo?',
      'answers': [
        '1Manage stress and anxiety',
        '1Improve my mood and happiness',
        '1Develop better sleep habits',
        '1Learn more about mental wellness',
        '1Find support within a community',
      ],
    },
    {
      'question': '2What is your primary reason for using Mentalo?',
      'answers': [
        '2Manage stress and anxiety',
        '2Improve my mood and happiness',
        '2Develop better sleep habits',
        '2Learn more about mental wellness',
        '2Find support within a community',
      ],
    },
    // ... Your questions and answers
  ];

  late List<List<bool>> _answersSelected;

  @override
  void initState() {
    super.initState();
    _answersSelected = _questions
        .map((question) => List<bool>.filled(question['answers'].length, false))
        .toList();
  }

  void _nextPage() {
    if (_controller.page!.toInt() < _questions.length - 1) {
      _controller.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _previousPage() {
    if (_controller.page!.toInt() > 0) {
      _controller.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  Widget _buildStepIndicator(int index) {
    return Container(
      width: 20,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.green : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Survey')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _questions.length,
              (index) => _buildStepIndicator(index),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text(
                      _questions[index]['question'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ..._questions[index]['answers'].asMap().entries.map(
                          (entry) => CheckboxListTile(
                            value: _answersSelected[index][entry.key],
                            title: Text(entry.value),
                            onChanged: (bool? value) {
                              setState(() {
                                _answersSelected[index][entry.key] =
                                    value ?? false;
                              });
                            },
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                        ),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: _previousPage,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                  ),
                  child: const Text('Back'),
                ),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
