import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:space_app/screens/home/view/model_screen.dart';
import 'package:space_app/theme/colors.dart';
import 'package:space_app/theme/l10n/app_localization.dart';

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
      height: 48.h,
      width: 291.w,
      child: TypeAheadField(
        noItemsFoundBuilder: (context) => SizedBox(
          height: 50.h,
          child: Container(
            color: DarkGreyB,
            child: Center(
              child: Text(
                'No items found',
                style: TextStyle(color: LightGrey, fontSize: 15.sp),
              ),
            ),
          ),
        ),
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
        ),
        textFieldConfiguration: TextFieldConfiguration(
          controller: _typeAheadController,
          decoration: InputDecoration(
            hintText: AppLocalization.of(context).getTranslatedValue("Search"),
            hintStyle: GoogleFonts.ptSans(
              textStyle: TextStyle(
                  color: LightGrey,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            prefixIconColor: LightGrey,
            prefixIcon: const Icon(Icons.search),
            fillColor: DarkGreyB,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(12.r),
            ),
            focusColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)),
          ),
          style: TextStyle(fontSize: 18.sp),
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
            contentPadding: EdgeInsets.only(right: 50.w, left: 5.w),
            minVerticalPadding: 15.h,
            visualDensity: VisualDensity.compact,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            leading: SizedBox(
              width: 50.w,
              height: 50.h,
              child: SvgPicture.asset(
                suggestion["image"],
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              suggestion["name"],
              style: TextStyle(
                  color: GreyText,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500),
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
                fontSize: 15.sp,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
