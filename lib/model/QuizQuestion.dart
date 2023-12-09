class QuizQuestion{
  String Question;
  List<String> answers;

  QuizQuestion({required this.Question,required this.answers});
  List<String> getshuffledquestions(){
  List<String> shuffled= List.of(answers);
  shuffled.shuffle();
  return shuffled;
  }
}