import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';
import 'package:space_app/screens/home/view/model_screen.dart';
import 'package:space_app/theme/colors.dart';

import 'planets_list.dart';

// ignore: must_be_immutable
class PlanetCard extends StatelessWidget {
  Planets planets;
  PlanetCard(this.planets, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        PlanetShape(),
        imagePlanet(),
        PlanetTitle(),
        backButtonPlanet(),
        cardButtonPlanet(context: context),
      ],
    );
  }

  Widget PlanetShape() {
    return Positioned(
      width: 180.w,
      height: 226.h,
      top: 70.h,
      left: 20.w,
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            color: planets.cardColor),
      ),
    );
  }

  Widget imagePlanet() {
    return Positioned(
      width: 220.w,
      height: 180.h,
      right: 23.w,
      child: RiveAnimation.asset(planets.aniImage),
    );
  }

  Widget PlanetTitle() {
    return Positioned(
      width: 190.w,
      height: 210.h,
      top: 80.h,
      left: 23.w,
      child: Stack(
        children: [
          Positioned(
            top: 90.h,
            left: 10.w,
            child: Text(
              planets.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 120.h,
            left: 10.w,
            right: 14.w,
            child: Text(planets.description,
                style: TextStyle(
                  color: GreyText,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      ),
    );
  }

  Widget cardButtonPlanet({required BuildContext context}) {
    return Positioned(
        top: 271.5.h,
        left: 91.5.w,
        child: SizedBox(
          width: 42.w,
          height: 42.h,
          child: CircleAvatar(
              backgroundColor: planets.buttonColor,
              foregroundColor: Colors.white,
              child: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModelPage(planets),
                      )),
                  icon: const Icon(Icons.arrow_forward))),
        ));
  }

  Widget backButtonPlanet() {
    return Positioned(
        top: 270.h,
        left: 90.w,
        child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )));
  }
}
