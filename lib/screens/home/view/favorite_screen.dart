import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/home/classes/favorites/favorites_card.dart';
import '../classes/favorites/favorite_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Stack(clipBehavior: Clip.none, children: <Widget>[
      Positioned(
          top: 0, child: SvgPicture.asset('assets/img/backFavorites.svg')),
      const Padding(
        padding: EdgeInsets.only(top: 60, left: 20),
        child: Text(
          'Favorites',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 100),
        child: FavoritesPager(),
      )
    ])));
  }

  Widget FavoritesPager() {
    final provider = Provider.of<FavoriteProvider>(context);
    final models = provider.model;
    // ignore: avoid_unnecessary_containers
    return Container(
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.28),
        scrollDirection: Axis.vertical,
        itemCount: models.length,
        itemBuilder: (context, index) => FavoritesCard(models[index]),
        padEnds: false,
      ),
    );
  }
}
