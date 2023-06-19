import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/screens/home/classes/data.dart';
import 'package:space_app/screens/home/classes/models/planets_list.dart';

import '../../../theme/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController _typeAheadController = TextEditingController();
  List<Planets> planets = getPlanets();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: SizedBox(
              height: 50,
              width: 310,
              child: TypeAheadField(
                noItemsFoundBuilder: (context) => SizedBox(
                  height: 50,
                  child: Center(
                    child: Text('No items found'),
                  ),
                ),
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  elevation: 0,
                ),
                textFieldConfiguration: TextFieldConfiguration(
                  controller: _typeAheadController,
                  decoration: InputDecoration(
                    hintText: 'Search for planets and stars',
                    hintStyle: GoogleFonts.ptSans(
                      textStyle: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    prefixIconColor: Colors.white70,
                    prefixIcon: const Icon(Icons.search),
                    fillColor: DarkGreyB,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  style: const TextStyle(fontSize: 18),
                  textAlignVertical: TextAlignVertical.bottom,
                  autofocus: true,
                ),
                suggestionsCallback: (pattern) async {
                  if (pattern.length > 0) {
                    return await StateService.getSuggestions(pattern);
                  } else {
                    return [];
                  }
                },
                itemBuilder: (context, suggestion) {
                  List<Planets> planets = getPlanets();
                  return ListTile(
                    contentPadding: EdgeInsets.only(right: 50, left: 5),
                    minVerticalPadding: 15,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    leading: Container(
                      width: 50,
                      child: SvgPicture.asset(suggestion["image"]),
                    ),
                    title: Text(
                      suggestion["name"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    tileColor: suggestion["color"],
                  );
                },
                onSuggestionSelected: (suggestion) {
                  print(suggestion);
                  // Navigator.popAndPushNamed(context, suggestion['route']);
                },
                errorBuilder: (context, error) => Text('$error',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
