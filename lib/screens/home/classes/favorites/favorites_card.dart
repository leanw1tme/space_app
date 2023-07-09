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
        imageFavorite(),
        FavoriteTitle(),
        backButton(),
        cardButton(context: context),
        FavoriteButton(context: context),
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

  Widget imageFavorite() {
    return Positioned(
      width: 170.w,
      height: 175.h,
      child: SizedBox(
          width: 50.w, height: 50.h, child: SvgPicture.asset(planets.image)),
    );
  }

  Widget FavoriteTitle() {
    return Positioned(
      width: 430.w,
      height: 200.h,
      child: Stack(
        children: [
          Positioned(
            top: 35.h,
            left: 150.w,
            child: Text(
              planets.name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 65.h,
            left: 150.w,
            right: 80.w,
            child: Text(
              planets.description,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 11.sp,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          Positioned(
            top: 125.h,
            left: 150.w,
            right: 70.w,
            child: Text(planets.name,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 11.sp,
                )),
          ),
        ],
      ),
    );
  }

  Widget cardButton({required BuildContext context}) {
    return Positioned(
        top: 136.5.h,
        left: 336.5.w,
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

  Widget backButton() {
    return Positioned(
        top: 135.h,
        left: 335.w,
        child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )));
  }

  Widget FavoriteButton({required BuildContext context}) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Positioned(
        top: 15.h,
        right: 20.w,
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
