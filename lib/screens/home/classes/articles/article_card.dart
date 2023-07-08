import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_app/theme/colors.dart';

import 'article_list.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  Articles articles;
  ArticleCard(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ArticleShape(),
          ImageShape(),
          imageArticle(),
          ArticleTitle(),
          backButton(),
          cardButton(context: context),
        ],
      ),
    );
  }

  Widget ArticleShape() {
    return Positioned(
      width: 353.w,
      height: 151.h,
      left: 22.w,
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            color: articles.cardColor),
      ),
    );
  }

  Widget ImageShape() {
    return Positioned(
      width: 118.w,
      height: 150.h,
      left: 22.w,
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    bottomLeft: Radius.circular(10.r))),
            color: articles.imageBack),
      ),
    );
  }

  Widget imageArticle() {
    return Positioned(
      width: 152.w,
      height: 132.h,
      top: 9.h,
      left: 3.w,
      child: SizedBox(
          width: 50.w, height: 50.h, child: SvgPicture.asset(articles.image)),
    );
  }

  Widget ArticleTitle() {
    return Positioned(
      width: 300.w,
      height: 280.h,
      left: 150.w,
      child: Stack(
        children: [
          Positioned(
            top: 20.h,
            left: 10.w,
            child: Text(
              articles.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: 50.h,
            left: 9.w,
            right: 85.w,
            child: Text(articles.description,
                style: TextStyle(
                  color: ArticleDes,
                  fontSize: 11.sp,
                )),
          ),
          Positioned(
            top: 120.h,
            left: 9.w,
            right: 70.w,
            child: Text(articles.date,
                style: TextStyle(
                  color: ArticleDate,
                  fontSize: 11.sp,
                )),
          ),
        ],
      ),
    );
  }

  Widget cardButton({required BuildContext context}) {
    return Positioned(
        top: 121.5.h,
        left: 336.5.w,
        child: SizedBox(
          width: 42.w,
          height: 42.h,
          child: CircleAvatar(
              backgroundColor: articles.buttonColor,
              foregroundColor: Colors.white,
              child: IconButton(
                  onPressed: () => Navigator.pushNamed(context, articles.route),
                  icon: const Icon(Icons.arrow_forward))),
        ));
  }

  Widget backButton() {
    return Positioned(
        top: 120.h,
        left: 335.w,
        child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )));
  }
}
