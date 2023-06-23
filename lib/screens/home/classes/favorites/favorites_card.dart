import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/home/classes/models/planets_list.dart';
import 'package:space_app/theme/colors.dart';

import '../../view/model_screen.dart';
import 'favorite_provider.dart';

// ignore: must_be_immutable
class FavoritesCard extends StatelessWidget {
  Planets planets;
  FavoritesCard(this.planets, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 120;
    double cardHeight = size.height * .18;
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          FavoriteShape(size, cardWidth, cardHeight),
          ImageShape(size, cardWidth, cardHeight),
          imageFavorite(size, cardWidth, cardHeight),
          FavoriteTitle(size, cardWidth, cardHeight),
          backButton(size, cardWidth, cardHeight),
          cardButton(size, cardWidth, cardHeight, context: context),
          FavoriteButton(size, cardWidth, cardHeight, context: context),
        ],
      ),
    );
  }

  Widget FavoriteShape(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      left: size.width - 265,
      child: Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: planets.cardColor),
      ),
    );
  }

  Widget ImageShape(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth - 135,
      height: cardHeight,
      left: size.width - 334,
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            color: planets.cardColor),
      ),
    );
  }

  Widget imageFavorite(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      left: size.width - 400,
      child: Container(
          width: 50, height: 50, child: SvgPicture.asset(planets.image)),
    );
  }

  Widget FavoriteTitle(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      left: size.width - 225,
      child: Container(
          child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 10,
            child: Text(
              planets.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 45,
            left: 0,
            right: 80,
            child: Text(
              planets.description,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 10,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Positioned(
            top: 110,
            left: 9,
            right: 70,
            child: Text(planets.name,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10,
                )),
          ),
        ],
      )),
    );
  }

  Widget cardButton(Size size, double cardWidth, double cardHeight,
      {required BuildContext context}) {
    return Positioned(
        width: cardWidth - 202,
        height: cardHeight,
        top: cardHeight * .45,
        left: size.width - 62,
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

  Widget backButton(
    Size size,
    double cardWidth,
    double cardHeight,
  ) {
    return Positioned(
        width: cardWidth - 199,
        height: cardHeight,
        top: cardHeight * .45,
        left: size.width - 63.5,
        child: const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            )));
  }

  Widget FavoriteButton(Size size, double cardWidth, double cardHeight,
      {required BuildContext context}) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Positioned(
        right: 25,
        child: IconButton(
            onPressed: () {
              provider.toggleFavorite(planets);
            },
            icon: provider.isExist(planets)
                ? const Icon(
                    Icons.favorite,
                    size: 30,
                    color: Colors.pink,
                  )
                : const Icon(
                    Icons.favorite_border,
                    size: 30,
                    color: Colors.pink,
                  )));
  }
}
