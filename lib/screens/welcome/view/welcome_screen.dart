import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:space_app/theme/l10n/app_localization.dart';

import '../../../theme/theme_app.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  StateMachineController? controller;
  SMIInput<bool>? switchInput;
  @override
  Widget build(BuildContext context) {
    Locale _locale = Locale('en');
    bool isEnglish = _locale.languageCode == 'en';
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
                AppLocalization.of(context)
                    .getTranslatedValue("language")
                    .toString(),
                style: GoogleFonts.ptSans(textStyle: theme.textTheme.bodyLarge),
              ),
              // TextButton(
              //   child: Text("Set locale to German"),
              //   onPressed: () => SpaceApp.of(context)
              //       ?.setLocale(Locale.fromSubtags(languageCode: 'en')),
              // ),
              // TextButton(
              //   child: Text("Set locale to English"),
              //   onPressed: () => SpaceApp.of(context)
              //       ?.setLocale(Locale.fromSubtags(languageCode: 'ru')),
              // ),
              Material(
                child: Switch.adaptive(
                  value: isEnglish,
                  onChanged: (value) {
                    SpaceApp.of(context)?.setLocale(isEnglish
                        ? Locale.fromSubtags(languageCode: 'en')
                        : Locale.fromSubtags(languageCode: 'ru'));
                  },
                ),
              ),
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
              onPressed: () => Navigator.popAndPushNamed(context, '/home'),
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
