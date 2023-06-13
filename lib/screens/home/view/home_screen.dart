import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:space_app/screens/home/classes/articles/article_card.dart';
import 'package:space_app/screens/home/classes/articles/article_list.dart';
import 'package:space_app/screens/home/classes/models/planet_card.dart';

import '../classes/models/planets_list.dart';
import '../classes/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(clipBehavior: Clip.none, children: [
      const Positioned.fill(
          child: RiveAnimation.asset('assets/ani/riv/spacehome.riv')),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 55),
                child: Search()),
            PlanetsPager(size),
            const Positioned(
                top: 475,
                left: 25,
                child: Text(
                  'Articles',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                )),
            ArticlesSlider(size)
          ],
        ),
      )
    ]);
  }

  Widget PlanetsPager(Size size) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: 500,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.52),
        itemCount: getPlanets().length,
        itemBuilder: (context, index) {
          final model = getPlanets()[index];
          return PlanetCard(model);
        },
        padEnds: false,
      ),
    );
  }

  Widget ArticlesSlider(Size size) {
    // ignore: avoid_unnecessary_containers
    return Container(
      height: 400,
      margin: const EdgeInsets.only(top: 515),
      child: PageView.builder(
        itemCount: getArticles().length,
        itemBuilder: (context, index) => ArticleCard(getArticles()[index]),
        padEnds: false,
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
