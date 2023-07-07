import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

import '../../../theme/l10n/app_localization.dart';
import '../../../theme/theme_app.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  StateMachineController? controller;
  SMIInput<bool>? switchInput;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Text(
            AppLocalization.of(context)
                .getTranslatedValue("Helloworld")
                .toString(),
            style: GoogleFonts.ptSans(
                textStyle: Theme.of(context).textTheme.bodyLarge),
          ),
          Center(
            child: InkWell(
              onTap: () {
                if (switchInput == null) return;
                final IsON = switchInput?.value ?? false;

                SpaceApp.of(context)?.setLocale(switchInput?.value == true
                    ? Locale.fromSubtags(languageCode: 'ru')
                    : Locale.fromSubtags(languageCode: 'en'));

                switchInput?.change(!IsON);
              },
              borderRadius: BorderRadius.circular(150),
              child: SizedBox(
                height: 100,
                width: 100,
                child: RiveAnimation.asset('assets/ani/riv/switch_button.riv',
                    stateMachines: ["Switch Machine"], onInit: (artboard) {
                  controller = StateMachineController.fromArtboard(
                      artboard, "Switch Machine");

                  if (controller == null) return;
                  artboard.addController(controller!);
                  switchInput = controller?.findInput("IsON");
                  switchInput?.change(true);
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
