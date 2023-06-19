import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:space_app/screens/home/classes/articles/article_card.dart';
import 'package:space_app/screens/home/classes/articles/article_list.dart';
import 'package:space_app/screens/home/classes/data.dart';
import 'package:space_app/screens/home/classes/models/planet_card.dart';
import 'package:space_app/theme/colors.dart';

import '../classes/models/planets_list.dart';
import '../classes/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    'Planets',
    'Stars',
    'Galaxies',
    'Nebulas',
  ];

  List<String> selectedCategories = [];
  @override
  Widget build(BuildContext context) {
    final filterModels = getPlanets().where((model) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(model.category);
    }).toList();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
                top: 0, child: SvgPicture.asset('assets/img/backHome.svg')),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 55),
                child: Search()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 105),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: categories
                      .map((category) => FilterChip(
                          selectedColor: Colors.white,
                          labelStyle: TextStyle(
                            color: GreyB,
                          ),
                          backgroundColor: DarkGreyB,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: GreyB),
                              borderRadius: BorderRadius.circular(10)),
                          showCheckmark: false,
                          selected: selectedCategories.contains(category),
                          label: Text(category),
                          onSelected: (selected) {
                            setState(() {
                              if (selected) {
                                selectedCategories.add(category);
                              } else {
                                selectedCategories.remove(category);
                              }
                            });
                          }))
                      .toList(),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 175),
              child: Container(
                child: PageView.builder(
                  controller: PageController(viewportFraction: 0.52),
                  itemCount: filterModels.length,
                  itemBuilder: (context, index) {
                    final model = filterModels[index];
                    return PlanetCard(model);
                  },
                  padEnds: false,
                ),
              ),
            ),
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
