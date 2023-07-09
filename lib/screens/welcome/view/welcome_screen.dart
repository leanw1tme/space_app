import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:space_app/theme/colors.dart';
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
    return Scaffold(
      backgroundColor: Blackground,
      body: Stack(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/img/welcome.svg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
              width: 140,
              height: 140,
              transform: Matrix4.translationValues(-40.w, 400.h, 0.0),
              child: const RiveAnimation.asset(
                'assets/ani/riv/mercury.riv',
                fit: BoxFit.scaleDown,
              )),
          Container(
              width: 140,
              height: 140,
              transform: Matrix4.translationValues(-30.w, 700.h, 0.0),
              child: const RiveAnimation.asset(
                'assets/ani/riv/uranus.riv',
                fit: BoxFit.scaleDown,
              )),
          Center(
            child: Container(
                width: 300,
                height: 300,
                transform: Matrix4.translationValues(0.w, 160.h, 0.0),
                child: const RiveAnimation.asset(
                  'assets/ani/riv/earth.riv',
                  fit: BoxFit.scaleDown,
                )),
          ),
          Container(
              width: 130,
              height: 130,
              transform: Matrix4.translationValues(250.w, 330.h, 0.0),
              child: const RiveAnimation.asset(
                'assets/ani/riv/venus.riv',
                fit: BoxFit.scaleDown,
              )),
          Container(
              width: 200,
              height: 200,
              transform: Matrix4.translationValues(220.w, 700.h, 0.0),
              child: const RiveAnimation.asset(
                'assets/ani/riv/mars.riv',
                fit: BoxFit.scaleDown,
              )),
          Padding(
            padding: EdgeInsets.only(top: 105.h, left: 25.w, right: 80.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Explore the Universe',
                  style:
                      GoogleFonts.ptSans(textStyle: theme.textTheme.bodyLarge),
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
      ),
    );
  }
}
