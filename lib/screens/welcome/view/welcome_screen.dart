import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final theme = Theme.of(context);
    return Stack(
      children: [
        const Positioned.fill(
            child: RiveAnimation.asset('assets/ani/riv/space_planets.riv')),
        Padding(
          padding: EdgeInsets.only(top: 105.h, left: 25.w, right: 80.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Explore the Universe',
                style: GoogleFonts.ptSans(textStyle: theme.textTheme.bodyLarge),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                'Journey through the cosmos with our space app',
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Positioned(
          left: 25.w,
          top: 310.h,
          child: SizedBox(
            width: 174.w,
            height: 47.h,
            child: FilledButton(
              onPressed: () => Navigator.popAndPushNamed(context, '/home'),
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r))),
              ),
              child: Text(
                'Get started',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
