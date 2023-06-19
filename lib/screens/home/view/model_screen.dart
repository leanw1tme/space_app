import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';

import '../../../theme/colors.dart';
import '../classes/models/planets_list.dart';

class ModelPage extends StatelessWidget {
  Planets model;
  ModelPage(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            child: Stack(clipBehavior: Clip.none, children: <Widget>[
          Positioned(
              top: 0, child: SvgPicture.asset('assets/img/backModel.svg')),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: SizedBox(
              height: 44,
              width: 44,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 65, left: 45),
            child: SizedBox(
              width: 275,
              height: 275,
              child: Center(
                child: RiveAnimation.asset(model.aniImage),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 375),
            child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                    color: DarkGreyB,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                height: 390,
                child: Stack(
                  children: [
                    Positioned(
                        top: 20,
                        right: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              size: 30,
                              color: Colors.pink,
                            ))),
                    const Positioned(
                      top: 27,
                      left: 34,
                      child: Text(
                        'Saturn',
                        style: TextStyle(color: Colors.white, fontSize: 27),
                      ),
                    ),
                    Positioned(
                      top: 67,
                      left: 34,
                      child: Text(
                        'The Jewel of the Solar System',
                        style: TextStyle(color: Colors.white70, fontSize: 17),
                      ),
                    ),
                    Positioned(
                      top: 108,
                      left: 34,
                      right: 24,
                      child: Text(
                        "Saturn is often referred to as the 'jewel of the solar system' due to its stunning rings that are visible from Earth. With a diameter of 116,460 km, Saturn is the second largest planet in our solar system and is known for its unique and beautiful ring system, which is composed of ice particles, dust, and small rocks. The rings are believed to be relatively young, having formed less than 100 million years ago from the debris of a destroyed moon or comet. Saturn's atmosphere is primarily composed of hydrogen and helium, with trace amounts of other gases.",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Positioned(
                      top: 350,
                      left: 33,
                      child: Text(
                        'By Daisy Stephenson | 02 May 2023',
                        style: TextStyle(color: Colors.white30, fontSize: 13),
                      ),
                    ),
                  ],
                )),
          ),
        ])));
  }
}
