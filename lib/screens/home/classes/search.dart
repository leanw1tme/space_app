import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/screens/home/view/model_screen.dart';
import 'package:space_app/theme/colors.dart';

import 'data.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _typeAheadController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 280,
      child: TypeAheadField(
        noItemsFoundBuilder: (context) => SizedBox(
          height: 50,
          child: Container(
            color: DarkGreyB,
            child: Center(
              child: Text(
                'No items found',
                style: TextStyle(color: LightGrey, fontSize: 15),
              ),
            ),
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
              textStyle: TextStyle(
                  color: LightGrey, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            prefixIconColor: LightGrey,
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
          autofocus: false,
        ),
        suggestionsCallback: (pattern) async {
          if (pattern.length > 0) {
            return await StateService.getSuggestions(pattern);
          } else {
            return [];
          }
        },
        itemBuilder: (context, suggestion) {
          return ListTile(
            contentPadding: EdgeInsets.only(right: 50, left: 5),
            minVerticalPadding: 15,
            visualDensity: VisualDensity.compact,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            leading: SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset(
                suggestion["image"],
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              suggestion["name"],
              style: TextStyle(
                  color: GreyText, fontSize: 15, fontWeight: FontWeight.w500),
            ),
            tileColor: suggestion["color"],
          );
        },
        onSuggestionSelected: (suggestion) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ModelPage(suggestion["model"]),
              ));
        },
        errorBuilder: (context, error) => Text('$error',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
