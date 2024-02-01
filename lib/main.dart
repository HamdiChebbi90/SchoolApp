import 'package:flutter/material.dart';
import 'package:project/auth/signin.dart';
import 'package:project/auth/signup.dart';
import 'package:project/home.dart';
import 'package:project/splash.dart';
import 'package:project/components/book.dart';
import 'package:project/components/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _quiz = Quiz(title: 'title', questions: [
    Question(question: 'What is the capital of France?', answers: [
      Answer(text: 'New York', isCorrect: false),
      Answer(text: 'London', isCorrect: false),
      Answer(text: 'Paris', isCorrect: true),
      Answer(text: 'Dublin', isCorrect: false),
    ]),
    Question(question: 'Who is CEO of Tesla?', answers: [
      Answer(text: 'Jeff Bezos', isCorrect: false),
      Answer(text: 'Elon Musk', isCorrect: true),
      Answer(text: 'Bill Gates', isCorrect: false),
      Answer(text: 'Tony Stark', isCorrect: false),
    ]),
    Question(question: 'The iPhone was created by which company?', answers: [
      Answer(text: 'Apple', isCorrect: true),
      Answer(text: 'Intel', isCorrect: false),
      Answer(text: 'Amazon', isCorrect: false),
      Answer(text: 'Microsoft', isCorrect: false),
    ]),
    Question(question: 'How many Harry Potter books are there?', answers: [
      Answer(text: '1', isCorrect: false),
      Answer(text: '4', isCorrect: false),
      Answer(text: '6', isCorrect: false),
      Answer(text: '7', isCorrect: true),
    ]),
    Question(question: 'How many sides does a triangle have?', answers: [
      Answer(text: '3', isCorrect: true),
      Answer(text: '4', isCorrect: false),
      Answer(text: '5', isCorrect: false),
      Answer(text: '6', isCorrect: false),
    ]),
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/SignInPage': (context) => SignInPage(),
        '/SignUpPage': (context) => SignUpPage(),
        '/HomePage': (context) => const HomePage(),
        '/BooksPage': (context) => const BooksPage(),
        '/QuizPage': (context) => QuizPage(quiz: _quiz),
      },
    );
  }
}
