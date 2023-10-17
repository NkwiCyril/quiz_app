import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.onPress, super.key});

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 215, 198, 172),
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 11),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))
          ),
          child: Text(
            text,
            style: GoogleFonts.lato(
              fontSize: 22, color: Colors.black
            ),
            textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
