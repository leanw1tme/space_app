import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';
import 'package:space_app/screens/home/classes/articles/article_card.dart';
import 'package:space_app/screens/home/classes/articles/article_list.dart';
import 'package:space_app/screens/home/classes/models/planet_card.dart';
import 'package:space_app/theme/colors.dart';

import '../../../theme/theme_app.dart';
import '../classes/models/planets_list.dart';
import '../classes/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StateMachineController? controller;
  SMIInput<bool>? switchInput;
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
    return Scaffold(
      backgroundColor: Blackground,
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/img/backHome.svg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 55.h),
              child: Search()),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 117.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: categories
                    .map((category) => FilterChip(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        selectedColor: Colors.white,
                        labelStyle: TextStyle(
                          color: GreyB,
                        ),
                        backgroundColor: DarkGreyB,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: GreyB),
                            borderRadius: BorderRadius.circular(10.r)),
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
            padding: EdgeInsets.only(top: 45.h, left: 313.w),
            child: InkWell(
              onTap: () {
                if (switchInput == null) return;
                // ignore: non_constant_identifier_names
                final IsON = switchInput?.value ?? false;

                SpaceApp.of(context)?.setLocale(switchInput?.value == true
                    ? const Locale.fromSubtags(languageCode: 'ru')
                    : const Locale.fromSubtags(languageCode: 'en'));

                switchInput?.change(!IsON);
              },
              borderRadius: BorderRadius.circular(150.r),
              child: SizedBox(
                height: 70.h,
                width: 70.w,
                child: RiveAnimation.asset('assets/ani/riv/switch_button.riv',
                    stateMachines: const ["Switch Machine"],
                    onInit: (artboard) {
                  controller = StateMachineController.fromArtboard(
                      artboard, "Switch Machine");

                  if (controller == null) return;
                  artboard.addController(controller!);
                  switchInput = controller?.findInput("IsON");
                  switchInput?.change(true);
                }),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 180.h),
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.53),
              itemCount: filterModels.length,
              itemBuilder: (context, index) {
                final model = filterModels[index];
                return PlanetCard(model);
              },
              padEnds: false,
            ),
          ),
          Positioned(
              top: 537.h,
              left: 25.w,
              child: Text(
                'Articles',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              )),
          ArticlesSlider()
        ],
      ),
    );
  }

  Widget ArticlesSlider() {
    // ignore: avoid_unnecessary_containers
    return Container(
      height: 400.h,
      margin: EdgeInsets.only(top: 582.h),
      child: PageView.builder(
        itemCount: getArticles().length,
        itemBuilder: (context, index) => ArticleCard(getArticles()[index]),
        padEnds: false,
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
