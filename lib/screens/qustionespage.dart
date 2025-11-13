import 'package:flutter/material.dart';
import '../styles/text_styles.dart';
import '../widgets/answerso_ptions.dart';
import '../models/questions.dart';

class Questionspage extends StatefulWidget {
  Questionspage({super.key});

  @override
  State<Questionspage> createState() => _QuestionspageState();
}

class _QuestionspageState extends State<Questionspage> {
  int? _selectedIndex;
  int _questionIndex = 0;

  void _answerSelected(int answerIndex, String answerText) {
    setState(() {
      _selectedIndex = answerIndex;
    });
  }

  void _nextQuestion() {
    if (_questionIndex >= quizData.length - 1) {
      print('The quiz is done ');

      return;
    }
    if (_selectedIndex != null) {
      setState(() {
        _questionIndex++;
        _selectedIndex = null;
      });
    } else {
      print("You must choose answer");
    }
  }

  void _previousQuestion() {
    if (_questionIndex > 0) {
      setState(() {
        _questionIndex--;
        _selectedIndex = null;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = quizData[_questionIndex];
    final List<dynamic> currentOptions = currentQuestion.chooses;
    return Scaffold(
      backgroundColor: const Color(0xFF231F3E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFF8E84FF),
                  borderRadius: BorderRadius.circular(29),
                  border: Border.all(color: Color(0xFFC4BFF9), width: 1.3),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.loop, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "Question ${_questionIndex + 1}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(currentQuestion.questionText, style: TextStyles.h1()),
              SizedBox(height: 30),
              ...List.generate(currentOptions.length, (index) {
                final answerText = currentOptions[index];
                return OptionButton(
                  answerText: answerText,
                  selected: _selectedIndex == index,
                  onTap: () => _answerSelected(index, answerText),
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
                        children: [
                          Icon(Icons.arrow_back),
                          SizedBox(width: 12),
                          const Text("Back"),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _nextQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8E84FF),
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
                          SizedBox(width: 12),
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
              SizedBox(height: 7),
              Center(
                child: Divider(
                  thickness: 3,
                  color: Colors.white,
                  indent: 130,
                  endIndent: 130,
                  radius: BorderRadius.circular(50),
                ),
              ),
              SizedBox(height: 7),
            ],
          ),
        ),
      ),
    );
  }
}
