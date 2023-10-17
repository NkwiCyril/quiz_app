import 'package:flutter/material.dart';
import 'package:flutter_quiz/button_screen.dart';
import 'package:flutter_quiz/data/questions_data.dart';
import 'package:flutter_quiz/final_screen.dart';
import 'package:flutter_quiz/question_screen.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz({super.key});

  @override
  State<StartQuiz> createState() {
    return _StartQuizState();
  }
}

class _StartQuizState extends State<StartQuiz> {

  List<String> selectedAnswers = []; // where I will store the string of answers selected
  var activeScreen = 'start';

  void changeScreen() {
    setState(() {
      activeScreen = 'next';
    });
  }

  void chooseAnswer(answer) {
    setState(() {
      selectedAnswers.add(answer);
      if (questionsData.length == selectedAnswers.length) { // if number of answers selected surpasses the number of questions
        // selectedAnswers = []; // clear the list
        activeScreen = 'final_screen'; // go back to the start screen
      }

    });
  }

  void restart() {
    setState(() {
      activeScreen = 'next';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(context) {

    Widget? screen;

    if (activeScreen == 'start') {
      screen = ButtonScreen(changeScreen);
    } else if (activeScreen == 'next') {
      screen = QuestionScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'final_screen') {
      screen = FinalScreen(selectedAnswers, onRestart: restart,);
    }



    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 126, 65, 42),
          ),
          child: screen,
        ),
      ),
    );
  }
}
