import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/answer_button.dart';
import 'package:practice/data/questions_data.dart';

class QuestionsDisplay extends StatefulWidget {
  const QuestionsDisplay({super.key});

  @override
  State<QuestionsDisplay> createState() {
    return _QuestionsDisplayState();
  }
}

class _QuestionsDisplayState extends State<QuestionsDisplay> {
  var _index = 0;
  Color color = const Color.fromARGB(255, 110, 184, 244);

  void nextQuestion() {
    setState(() {
      _index++;
    });
  }

  void prevQuestion() {
    setState(() {
      if (_index >= 0) {
        _index--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var currentQuestion = questionData[_index];
    if (_index > 0) {
      color = Colors.blue;
    } 

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shadowColor: null,
          title: Center(
            child: Text('Flutter Tryout',
                style: GoogleFonts.montserrat(
                    fontSize: 25, fontWeight: FontWeight.bold)),
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Select one answer',
                    style: GoogleFonts.montserratAlternates(
                        fontStyle: FontStyle.italic, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  Text(
                    currentQuestion.question,
                    style: GoogleFonts.questrial(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ...currentQuestion.answer.map((answer) {
                    return AnswerButton(
                      answer: answer,
                    );
                  }),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: prevQuestion,
                          style: TextButton.styleFrom(
                              backgroundColor: color,
                              foregroundColor: Colors.white,
                            ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            const Icon(Icons.navigate_before),
                            Text(
                              'Prev',
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],),
                      ),                          
                          
                      TextButton(
                          onPressed: nextQuestion,
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                            Text(
                              'Next',
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const Icon(Icons.navigate_next),
                          ],),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
