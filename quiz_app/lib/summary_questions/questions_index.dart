import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsIndex extends StatelessWidget {
  const QuestionsIndex(
      {required this.questionIndex, required this.isCorrect, super.key});

  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: isCorrect ? const Color.fromARGB(255, 215, 198, 172): Colors.brown, 
            shape: BoxShape.circle),
        child: Text(
          ((questionIndex) + 1).toString(),
          style: GoogleFonts.acme(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
