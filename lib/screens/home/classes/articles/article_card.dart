import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:space_app/theme/colors.dart';

import 'article_list.dart';

// ignore: must_be_immutable
class ArticleCard extends StatelessWidget {
  Articles articles;
  ArticleCard(this.articles, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width - 120;
    double cardHeight = size.height * .18;
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          ArticleShape(size, cardWidth, cardHeight),
          ImageShape(size, cardWidth, cardHeight),
          imageArticle(size, cardWidth, cardHeight),
          ArticleTitle(size, cardWidth, cardHeight),
          backButton(size, cardWidth, cardHeight),
          cardButton(size, cardWidth, cardHeight, context: context),
        ],
      ),
    );
  }

  Widget ArticleShape(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      left: size.width - 265,
      child: Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: articles.cardColor),
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
            color: articles.imageBack),
      ),
    );
  }

  Widget imageArticle(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight,
      top: 5,
      left: size.width - 400,
      child: Container(
          width: 50, height: 50, child: SvgPicture.asset(articles.image)),
    );
  }

  Widget ArticleTitle(Size size, double cardWidth, double cardHeight) {
    return Positioned(
      width: cardWidth,
      height: cardHeight + 60,
      bottom: 65,
      left: size.width - 225,
      child: Container(
          child: Stack(
        children: [
          Positioned(
            top: 90,
            left: 10,
            child: Text(
              articles.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Positioned(
            top: 115,
            left: 9,
            right: 80,
            child: Text(articles.description,
                style: TextStyle(
                  color: ArticleDes,
                  fontSize: 10,
                )),
          ),
          Positioned(
            top: 180,
            left: 9,
            right: 70,
            child: Text(articles.date,
                style: TextStyle(
                  color: ArticleDate,
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
              backgroundColor: articles.buttonColor,
              foregroundColor: Colors.white,
              child: IconButton(
                  onPressed: () => Navigator.pushNamed(context, articles.route),
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
}
