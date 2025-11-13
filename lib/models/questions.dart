class Questions {
  final String questionText;
  final List<String> chooses;
  final String correctAnswers;

  Questions({
    required this.questionText,
    required this.chooses,
    required this.correctAnswers,
  });
}

final List<Questions> quizData = [
  Questions(
    questionText:
        "How would you describe your level of satisfaction with the healthcare system?",
    chooses: ["Strongly satasfied", "Satasfied", "Nutral", "Not stasfied"],
    correctAnswers: "stasfied",
  ),
  Questions(
    questionText: "What vitamins do you take?",
    chooses: ["Vitamin D3", "Vitamin B", "Zinc", "Magnesim"],
    correctAnswers: "Zinc",
  ),
];
