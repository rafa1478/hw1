import 'package:flutter/material.dart';
import 'package:quiz/screens/startscreen.dart';
import 'screens/qustionespage.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(),
        '/q1': (context) => Questionspage(),
      },
    );
  }
}
