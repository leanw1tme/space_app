import 'package:flutter/material.dart';

import '../../../../theme/colors.dart';

class Planets {
  String name;
  String aniImage;
  String image;
  String description;
  Color cardColor;
  Color buttonColor;
  String route;
  String category;

  Planets(this.name, this.aniImage, this.image, this.description,
      this.cardColor, this.buttonColor, this.route, this.category);
}

List<Planets> getPlanets() {
  List<Planets> listPlanets = [];
  listPlanets.add(Planets(
      'Mother Earth',
      'assets/ani/riv/earth.riv',
      'assets/img/Earth.svg',
      'Earth is the third planet from the sun and the only known planet to support life. It has a diameter of 12,742 km.',
      EarthBack,
      EarthButton,
      '/home',
      'Planets'));
  listPlanets.add(Planets(
      'Venus',
      'assets/ani/riv/venus.riv',
      'assets/img/Venus.svg',
      "Venus is the second planet from the sun and is often referred to as the Earth's sister planet.",
      VenusBack,
      VenusButton,
      '/',
      'Stars'));
  listPlanets.add(Planets(
      'Mars',
      'assets/ani/riv/mars.riv',
      'assets/img/Mars.svg',
      'Mars is the fourth planet from the sun and the second smallest planet in our solar system.',
      MarsBack,
      MarsButton,
      '/',
      'Galaxies'));
  listPlanets.add(Planets(
      'Uranus',
      'assets/ani/riv/uranus.riv',
      'assets/img/Uranus.svg',
      'Uranus is the seventh planet from the Sun and the third-largest planet in the Solar System.',
      UranusBack,
      UranusButton,
      '/',
      'Nebulas'));
  return listPlanets.toList();
}
