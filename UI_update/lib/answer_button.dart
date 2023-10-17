
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({required this.answer, super.key});

  final String answer;

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {

  Color color = Colors.blue;

  void changeColor() {
    setState(() {
      if (color == Colors.blue) {
        color = Colors.black;
      } else if (color == Colors.black) {
        color = Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: changeColor,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0)
          ),
          backgroundColor: color
        ),
        child: Text(
          widget.answer.toString(),
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        )
      ),
    );
  }
}