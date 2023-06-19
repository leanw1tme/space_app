import 'package:flutter/material.dart';
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
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 200;
    double cardHeight = size.height * .27;
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          PlanetShape(size, cardWidth, cardHeight),
          imagePlanet(size, cardWidth, cardHeight),
          PlanetTitle(size, cardWidth, cardHeight),
          backButtonPlanet(size, cardWidth, cardHeight),
          cardButtonPlanet(size, cardWidth, cardHeight, context: context),
        ],
      ),
    );
  }

  Widget PlanetShape(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      top: cardHeight - 140,
      left: size.width - 335,
      child: Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: planets.cardColor),
      ),
    );
  }

  Widget imagePlanet(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth + 20,
      height: cardHeight + 20,
      top: cardHeight - 250,
      left: size.width - 370,
      child: Container(
        child: RiveAnimation.asset(planets.aniImage),
      ),
    );
  }

  Widget PlanetTitle(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      top: cardHeight - 140,
      left: size.width - 335,
      child: Container(
          child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 10,
            child: Text(
              planets.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Positioned(
            top: 120,
            left: 10,
            right: 14,
            child: Text(planets.description,
                style: TextStyle(
                  color: GreyText,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      )),
    );
  }

  Widget cardButtonPlanet(Size size, double cardWidth, double cardHeight,
      {required BuildContext context}) {
    return Positioned(
        width: cardWidth - 120,
        height: cardHeight,
        top: cardHeight - 40,
        left: size.width - 275,
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircleAvatar(
              backgroundColor: planets.buttonColor,
              foregroundColor: Colors.white,
              child: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModelPage(planets),
                      )),
                  icon: Icon(Icons.arrow_forward))),
        ));
  }

  Widget backButtonPlanet(
    Size size,
    double cardWidth,
    double cardHeight,
  ) {
    return Positioned(
        width: cardWidth - 117,
        height: cardHeight,
        top: cardHeight - 40,
        left: size.width - 276.5,
        child: const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            )));
  }
}
