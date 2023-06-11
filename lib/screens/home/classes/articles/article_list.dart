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
