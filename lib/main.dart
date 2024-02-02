import 'package:flutter/material.dart';
import 'package:project/auth/signin.dart';
import 'package:project/auth/signup.dart';
import 'package:project/components/events.dart';
import 'package:project/data/quizdata.dart';
import 'package:project/firebase_options.dart';
import 'package:project/home.dart';
import 'package:project/splash.dart';
import 'package:project/components/book.dart';
import 'package:project/components/quiz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/SignInPage': (context) => const SignInPage(),
        '/SignUpPage': (context) => const SignUpPage(),
        '/HomePage': (context) => const HomePage(),
        '/BooksPage': (context) => const BooksPage(),
        '/QuizPage': (context) => QuizPage(quiz: quizzes[0]),
        '/EventPage': (context) => const EventPage(),
      },
    );
  }
}
