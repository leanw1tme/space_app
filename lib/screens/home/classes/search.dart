import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/theme/colors.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 310,
      child: TextField(
          style: const TextStyle(fontSize: 18),
          textAlignVertical: TextAlignVertical.bottom,
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
            fillColor: DarkGreyT,
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
          )),
    );
  }
}
