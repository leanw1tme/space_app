import 'package:flutter/material.dart';
import 'package:space_app/theme/colors.dart';

class Articles {
  String name;
  String date;
  String image;
  String description;
  Color cardColor = DarkGreyB;
  Color imageBack;
  Color buttonColor;
  String route;

  Articles(this.name, this.date, this.image, this.description, this.imageBack,
      this.buttonColor, this.route);
}

List<Articles> getArticles() {
  List<Articles> listArticles = [];
  listArticles.add(Articles(
      'Ice giant - Uranus',
      'By Louise Stark | 12 May 2023',
      'assets/img/Saturn.svg',
      'Uranus is a fascinating planet that is often overlooked due to its distance from Earth and lack of visible features.',
      SaturnBack,
      SaturnButton,
      '/home'));
  listArticles.add(Articles(
      'Ice giant - Uranus',
      'By Louise Stark | 12 May 2023',
      'assets/img/Saturn.svg',
      'Uranus is a fascinating planet that is often overlooked due to its distance from Earth and lack of visible features.',
      SaturnBack,
      SaturnButton,
      '/home'));
  return listArticles;
}
