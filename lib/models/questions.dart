class Questions {
  final String questionText;
  final List<String> chooses;
  final List<int> correctAnswers;
  final bool multichooses;

  Questions({
    required this.questionText,
    required this.chooses,
    required this.correctAnswers,
    this.multichooses = false,
  });
}

final List<Questions> quizData = [
  Questions(
    questionText:
        "How would you describe your level of satisfaction with the healthcare system?",
    chooses: ["Strongly satasfied", "Satasfied", "Nutral", "Not stasfied"],
    correctAnswers: [1],
    multichooses: false,
  ),
  Questions(
    questionText: "What vitamins do you take?",
    chooses: ["Vitamin D3", "Vitamin B", "Zinc", "Magnesim"],
    correctAnswers: [1, 2],
    multichooses: true,
  ),
];
