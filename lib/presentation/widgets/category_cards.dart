import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/models/categories.dart';

class CategoryCards extends StatelessWidget {
  const CategoryCards({super.key, required this.categories});
  final Categories categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: categories.categoryBoxColor,
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16, top: 16),
              child: Text(
                categories.categoryName,
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              alignment: Alignment.bottomRight,
              categories.categoryImages,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
