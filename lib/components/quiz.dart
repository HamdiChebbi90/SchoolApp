import 'package:flutter/material.dart';
import 'package:project/data/quizdata.dart';

class QuizPage extends StatefulWidget {
  final Quiz quiz;

  const QuizPage({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentIndex = 0;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          LinearProgressIndicator(
            value: _currentIndex / widget.quiz.questions.length,
          ),
          const SizedBox(height: 16.0),
          Text(
            'سؤال عدد ${_currentIndex + 1} من ${widget.quiz.questions.length}',
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 16.0),
          Text(
            widget.quiz.questions[_currentIndex].question,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ...widget.quiz.questions[_currentIndex].answers.map((answer) {
            return ListTile(
              title: Text(
                answer.text,
                textAlign: TextAlign.end,
              ),
              onTap: () {
                if (answer.isCorrect) {
                  _score++;
                }

                setState(() {
                  _currentIndex++;
                });

                if (_currentIndex == widget.quiz.questions.length) {
                  _showResultsDialog();

                  _currentIndex = 0;
                }
              },
            );
          }),
        ],
      ),
    );
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('النتيجة',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end),
          content: Text(
              'لقد تحصلت على عدد $_score من ${widget.quiz.questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
