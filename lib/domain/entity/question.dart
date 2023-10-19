class Question {
  final int? id;
  final String question;
  final String firstOption;
  final String secondOption;
  final String thirdOption;
  final String correctAnswear;

  const Question({
    this.id,
    required this.question,
    required this.firstOption,
    required this.secondOption,
    required this.thirdOption,
    required this.correctAnswear,
  });

  @override
  String toString() => "$id, $question, $firstOption, $secondOption, $thirdOption, $correctAnswear";
}
