import 'package:flutter/material.dart';
import 'qustionespage.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    bool allCorrect = score == totalQuestions;
    return Scaffold(
      backgroundColor: const Color(0xFF231F3E),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 100, color: Colors.amber),

              const SizedBox(height: 20),

              Text(
                "You finished the exam",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "Your result is :",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),

              const SizedBox(height: 10),

              Text(
                "$score / $totalQuestions",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),
              if (!allCorrect)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => QuestionsPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8E84FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    " Retray",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              if (allCorrect)
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8E84FF),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Exit",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
