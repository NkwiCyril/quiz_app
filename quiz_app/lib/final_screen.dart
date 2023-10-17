import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions_data.dart';
import 'package:flutter_quiz/summary_questions/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen(this.choosenAnswers, {required this.onRestart, super.key});

  final void Function() onRestart;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {

    final List<Map<String, Object>> summary = [];
    
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionsData[i].text,
        'user_answer': choosenAnswers[i],
        'correct_answer': questionsData[i].answers[0]
      });
    }
    return summary;
  }


  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final y = questionsData.length;
    final x = summaryData.where(
      (data) => data['user_answer'] == data['correct_answer']
    ).length;

    String s;
    if (x > 1) {
      s = "s";
    } else {
      s = "";
    }

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $x question$s out of $y correctly.',
              style: GoogleFonts.acme(
                fontSize: 23,
                color: Colors.white,
                letterSpacing: 0.5
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
          
            QuestionSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh, color: Colors.brown,),
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(color: Color.fromARGB(255, 112, 42, 16), fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}

