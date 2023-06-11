import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        const Positioned.fill(
            child: RiveAnimation.asset('assets/ani/riv/space_planets.riv')),
        Padding(
          padding: const EdgeInsets.only(top: 105, left: 25, right: 80),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Explore the Universe',
                style: GoogleFonts.ptSans(textStyle: theme.textTheme.bodyLarge),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Journey through the cosmos with our space app',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Positioned(
          left: 25,
          top: 310,
          child: SizedBox(
            width: 174,
            height: 47,
            child: FilledButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
              ),
              child: const Text(
                'Get started',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
