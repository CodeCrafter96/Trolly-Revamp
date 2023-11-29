import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/data/categories_cube.dart';
import 'package:trolly_revamp/presentation/pages/product_screen.dart';
import 'package:trolly_revamp/presentation/widgets/category_cards.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildGridView();
  }

  Widget buildGridView() {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          mainAxisExtent: 150,
        ),
        physics: BouncingScrollPhysics(),
        itemCount: categories_cube.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductScreen(),
                  ),
                );
              },
              child: CategoryCards(categories: categories_cube[index]));
        },
      ),
    );
  }
}
