 class QuestionModel {
  const QuestionModel({required this.text, required this.answers});

   final String text;
   final List <String> answers;

   List<String> getShuffledAnswers() {

    var shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();

    return shuffledAnswers;

   }
 }