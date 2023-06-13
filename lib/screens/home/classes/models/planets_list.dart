import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class Planets {
  String name;
  String image;
  String description;
  Color cardColor;
  Color buttonColor;
  String route;
  String category;

  Planets(this.name, this.image, this.description, this.cardColor,
      this.buttonColor, this.route, this.category);
}

String text = "";

List<Planets> getPlanets() {
  List<Planets> listPlanets = [];
  listPlanets.add(Planets(
      'Mother Earth',
      'assets/ani/riv/earth.riv',
      'Earth is the third planet from the sun and the only known planet to support life. It has a diameter of 12,742 km.',
      EarthBack,
      EarthButton,
      '/',
      'Planets'));
  listPlanets.add(Planets(
      'Venus',
      'assets/ani/riv/venus.riv',
      "Venus is the second planet from the sun and is often referred to as the Earth's sister planet.",
      VenusBack,
      VenusButton,
      '/',
      'Stars'));
  listPlanets.add(Planets(
      'Mars',
      'assets/ani/riv/mars.riv',
      'Mars is the fourth planet from the sun and the second smallest planet in our solar system.',
      MarsBack,
      MarsButton,
      '/',
      'Galaxies'));
  listPlanets.add(Planets(
      'Saturn',
      'assets/ani/riv/saturn.riv',
      'Saturn is the second largest planet in our solar system and is known for its beautiful rings.',
      SaturnBack,
      SaturnButton,
      '/',
      'Nebulas'));
  return listPlanets;
}
