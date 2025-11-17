import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../widgets/answerso_ptions.dart';
import '../models/questions.dart';
import 'resultpage.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  List<int> _selectedIndexes = [];
  int _questionIndex = 0;
  int score = 0;

  void _answerSelected(int index) {
    setState(() {
      final currentQuestion = quizData[_questionIndex];
      if (currentQuestion.multichooses) {
        if (_selectedIndexes.contains(index)) {
          _selectedIndexes.remove(index);
        } else {
          _selectedIndexes.add(index);
        }
      } else {
        _selectedIndexes = [index];
      }
    });
  }

  void _nextQuestion() {
    final currentQuestion = quizData[_questionIndex];
    if (_selectedIndexes.isEmpty) return;

    if (currentQuestion.multichooses) {
      _selectedIndexes.sort();
      List<int> correct = List.from(currentQuestion.correctAnswers)..sort();
      if (_selectedIndexes.length == correct.length &&
          ListEquality().equals(_selectedIndexes, correct)) {
        score++;
      }
    } else {
      if (_selectedIndexes.first == currentQuestion.correctAnswers.first) {
        score++;
      }
    }

    if (_questionIndex >= quizData.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              ResultPage(score: score, totalQuestions: quizData.length),
        ),
      );
      return;
    }

    setState(() {
      _questionIndex++;
      _selectedIndexes.clear();
    });
  }

  void _previousQuestion() {
    if (_questionIndex > 0) {
      setState(() {
        _questionIndex--;
        _selectedIndexes.clear();
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quizData[_questionIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF231F3E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF8E84FF),
                  borderRadius: BorderRadius.circular(29),
                  border: Border.all(
                    color: const Color(0xFFC4BFF9),
                    width: 1.3,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("images/question.png", height: 24),
                    const SizedBox(width: 6),
                    Text(
                      "Question ${_questionIndex + 1}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Text(
                currentQuestion.questionText,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),

              const SizedBox(height: 30),

              ...List.generate(currentQuestion.chooses.length, (index) {
                return OptionButton(
                  answerText: currentQuestion.chooses[index],
                  selected: _selectedIndexes.contains(index),
                  onTap: () => _answerSelected(index),
                );
              }),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _previousQuestion,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Color(0xFFC4BFF9)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.arrow_back),
                          SizedBox(width: 12),
                          Text("Back"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF8E84FF),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _questionIndex >= quizData.length - 1
                                ? "Finish"
                                : "Next",
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            _questionIndex >= quizData.length - 1
                                ? Icons.done_all
                                : Icons.arrow_forward,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 7),
              const Center(
                child: Divider(
                  thickness: 3,
                  color: Colors.white,
                  indent: 130,
                  endIndent: 130,
                ),
              ),
              const SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
