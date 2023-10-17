import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen(this.switchScreen, {super.key });

  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tap the button start.',
            style: GoogleFonts.acme(
              fontSize: 27, 
              color: Colors.white,
              letterSpacing: 0.5
            ),
          ),
          const Padding(padding:  EdgeInsets.symmetric(vertical: 10)),
          OutlinedButton.icon(
              onPressed: switchScreen,
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 215, 198, 172),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10)),
              icon: const Icon(Icons.start),
              label: Text(
                'Start',
                style: GoogleFonts.acme(
                  fontSize: 23
                ),
              ))
        ],
      ),
    );
  }
}
