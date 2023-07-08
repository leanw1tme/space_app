import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/home/classes/models/planets_list.dart';

import '../../view/model_screen.dart';
import 'favorite_provider.dart';

// ignore: must_be_immutable
class FavoritesCard extends StatelessWidget {
  Planets planets;
  FavoritesCard(this.planets, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        FavoriteShape(),
        // ImageShape(),
        // imageFavorite(),
        // FavoriteTitle(),
        // backButton(),
        // cardButton(context: context),
        // FavoriteButton(context: context),
      ],
    );
  }

  Widget FavoriteShape() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 15.h),
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            color: planets.cardColor),
      ),
    );
  }

  Widget ImageShape() {
    return Positioned(
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

  Widget imageFavorite() {
    return Positioned(
      child: SizedBox(
          width: 50, height: 50, child: SvgPicture.asset(planets.image)),
    );
  }

  Widget FavoriteTitle() {
    return Positioned(
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

  Widget cardButton({required BuildContext context}) {
    return Positioned(
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

  Widget backButton() {
    return Positioned(
        child: const SizedBox(
            width: 50,
            height: 50,
            child: CircleAvatar(
              backgroundColor: Colors.white,
            )));
  }

  Widget FavoriteButton({required BuildContext context}) {
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
