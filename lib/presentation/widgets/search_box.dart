import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/utils/colors.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2.0,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          buildSearchBox(),
          const SizedBox(height: 22),
        ],
      ),
    );
  }

  Widget buildSearchBox() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color.fromRGBO(235, 165, 0, 0.05),
        border: Border.all(
          color: AppColors.orange,
          width: 0.5,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            searchIC,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: TextFormField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                  hintText: 'What are you looking for? Search here...',
                  hintStyle: GoogleFonts.hindMadurai(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
