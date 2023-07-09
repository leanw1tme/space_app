import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/home/classes/favorites/favorites_card.dart';
import 'package:space_app/theme/colors.dart';
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
        backgroundColor: Blackground,
        body: Stack(clipBehavior: Clip.none, children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/img/backFavorites.svg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 60.h, left: 20.w),
            child: Text(
              'Favorites',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100.h),
            child: FavoritesPager(),
          )
        ]));
  }

  Widget FavoritesPager() {
    final provider = Provider.of<FavoriteProvider>(context);
    final models = provider.model;
    // ignore: avoid_unnecessary_containers
    return Container(
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.29.h),
        scrollDirection: Axis.vertical,
        itemCount: models.length,
        itemBuilder: (context, index) => FavoritesCard(models[index]),
        padEnds: false,
      ),
    );
  }
}
