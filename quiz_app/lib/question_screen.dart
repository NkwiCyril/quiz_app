import 'package:flutter/material.dart';
import 'package:flutter_quiz/custom/answer_button.dart';
import 'package:flutter_quiz/data/questions_data.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.onSelectAnswer, super.key});

  final void Function(String selectedAnswer) onSelectAnswer;  // I would have to pass the answer selected through from this widget to the
  // startquiz widget in order to store in the list created

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var index = 0; 

  void nextQuestion(String selectedAnswer) {

    widget.onSelectAnswer(selectedAnswer); // get access to the widget inside of the state class

    setState(() {
      index++;
    });
  }


  @override
  Widget build(BuildContext context){

    final currentQuestion = questionsData[index];

    return  Center(
      child:
         Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                style: GoogleFonts.acme(
                  fontSize: 25, color: Colors.white, letterSpacing: 0.5
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        
              ...currentQuestion.getShuffledAnswers().map((answer){
                return AnswerButton(
                  text: answer, 
                  onPress: () {
                    nextQuestion(answer);
                  });
              }),
            ],
          ),
        ),
      );
  }
}