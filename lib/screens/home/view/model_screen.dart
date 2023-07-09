import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:space_app/screens/home/classes/favorites/favorite_provider.dart';

import '../../../theme/colors.dart';
import '../classes/models/planets_list.dart';

class ModelPage extends StatelessWidget {
  Planets model;
  ModelPage(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
        backgroundColor: Blackground,
        body: Stack(clipBehavior: Clip.none, children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/img/backModel.svg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.h, left: 20.w),
            child: SizedBox(
              height: 44.h,
              width: 44.w,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 65.h, left: 60.w),
            child: SizedBox(
              width: 275.w,
              height: 275.h,
              child: Center(
                child: RiveAnimation.asset(model.aniImage),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 375.h),
            child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                    color: DarkGreyB,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r))),
                height: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                        top: 20.h,
                        right: 20.w,
                        child: IconButton(
                            onPressed: () {
                              provider.toggleFavorite(model);
                            },
                            icon: provider.isExist(model)
                                ? Icon(
                                    Icons.favorite,
                                    size: 30.sp,
                                    color: Colors.pink,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 30.sp,
                                    color: Colors.pink,
                                  ))),
                    Positioned(
                      top: 27.h,
                      left: 34.w,
                      child: Text(
                        'Saturn',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      ),
                    ),
                    Positioned(
                      top: 72.h,
                      left: 34.w,
                      child: Text(
                        'The Jewel of the Solar System',
                        style:
                            TextStyle(color: Colors.white70, fontSize: 20.sp),
                      ),
                    ),
                    Positioned(
                      top: 116.h,
                      left: 34.w,
                      right: 24.w,
                      child: Text(
                        "Saturn is often referred to as the 'jewel of the solar system' due to its stunning rings that are visible from Earth. With a diameter of 116,460 km, Saturn is the second largest planet in our solar system and is known for its unique and beautiful ring system, which is composed of ice particles, dust, and small rocks. The rings are believed to be relatively young, having formed less than 100 million years ago from the debris of a destroyed moon or comet. Saturn's atmosphere is primarily composed of hydrogen and helium, with trace amounts of other gases.",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Positioned(
                      top: 435.h,
                      left: 33.w,
                      child: Text(
                        'By Daisy Stephenson | 02 May 2023',
                        style:
                            TextStyle(color: Colors.white30, fontSize: 15.sp),
                      ),
                    ),
                  ],
                )),
          ),
        ]));
  }
}
