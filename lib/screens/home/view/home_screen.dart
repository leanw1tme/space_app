import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:space_app/screens/home/classes/articles/article_card.dart';
import 'package:space_app/screens/home/classes/articles/article_list.dart';
import 'package:space_app/screens/home/classes/models/planet_card.dart';

import '../../../theme/colors.dart';
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
    return Stack(
      clipBehavior: Clip.none,
      children: [
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
              InkWell(child: PlanetsPager(size)),
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
      ],
    );
  }
}

Widget PlanetsPager(Size size) {
  // ignore: avoid_unnecessary_containers
  return Container(
    height: 500,
    child: PageView.builder(
      controller: PageController(viewportFraction: 0.52),
      itemCount: getPlanets().length,
      itemBuilder: (context, index) => PlanetCard(getPlanets()[index]),
      padEnds: false,
    ),
  );
}

List<Planets> getPlanets() {
  List<Planets> listPlanets = [];
  listPlanets.add(Planets(
      'Mother Earth',
      'assets/ani/riv/earth.riv',
      'Earth is the third planet from the sun and the only known planet to support life. It has a diameter of 12,742 km.',
      EarthBack,
      EarthButton,
      '/'));
  listPlanets.add(Planets(
      'Venus',
      'assets/ani/riv/venus.riv',
      "Venus is the second planet from the sun and is often referred to as the Earth's sister planet.",
      VenusBack,
      VenusButton,
      '/'));
  listPlanets.add(Planets(
      'Mars',
      'assets/ani/riv/mars.riv',
      'Mars is the fourth planet from the sun and the second smallest planet in our solar system.',
      MarsBack,
      MarsButton,
      '/'));
  listPlanets.add(Planets(
      'Saturn',
      'assets/ani/riv/saturn.riv',
      'Saturn is the second largest planet in our solar system and is known for its beautiful rings.',
      SaturnBack,
      SaturnButton,
      '/'));
  return listPlanets;
}

Widget ArticlesSlider(Size size) {
  // ignore: avoid_unnecessary_containers
  return Container(
    height: 400,
    margin: EdgeInsets.only(top: 515),
    child: PageView.builder(
      itemCount: getArticles().length,
      itemBuilder: (context, index) => ArticleCard(getArticles()[index]),
      padEnds: false,
      clipBehavior: Clip.hardEdge,
    ),
  );
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
