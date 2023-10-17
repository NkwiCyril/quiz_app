import 'package:flutter/material.dart';
import 'package:flutter_quiz/summary_questions/questions_index.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical:4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    QuestionsIndex(
                        questionIndex: data['question_index'] as int,
                        isCorrect:
                            data['user_answer'] == data['correct_answer']),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.acme(
                              fontSize: 19,
                              color: Colors.white,
                              letterSpacing: 0.5
                            ),
                          ),
                          Text(
                            data['user_answer'] as String,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          Text(
                            data['correct_answer'] as String,
                            style: const TextStyle(color: Color.fromARGB(255, 215, 198, 172), fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
