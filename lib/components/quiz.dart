import 'package:flutter/material.dart';

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
        children: [
          LinearProgressIndicator(
            value: _currentIndex / widget.quiz.questions.length,
          ),
          SizedBox(height: 16.0),
          Text(
            'Question ${_currentIndex + 1} of ${widget.quiz.questions.length}',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 16.0),
          Text(
            widget.quiz.questions[_currentIndex].question,
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 16.0),
          ...widget.quiz.questions[_currentIndex].answers.map((answer) {
            return ListTile(
              title: Text(answer.text),
              onTap: () {
                if (answer.isCorrect) {
                  _score++;
                }

                setState(() {
                  _currentIndex++;
                });

                if (_currentIndex == widget.quiz.questions.length) {
                  _showResultsDialog();
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
          title: Text('Results'),
          content: Text(
              'Your score is $_score out of ${widget.quiz.questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class Quiz {
  final String title;
  final List<Question> questions;

  Quiz({required this.title, required this.questions});
}

class Question {
  final String question;
  final List<Answer> answers;

  Question({required this.question, required this.answers});
}

class Answer {
  final String text;
  final bool isCorrect;

  Answer({required this.text, required this.isCorrect});
}
