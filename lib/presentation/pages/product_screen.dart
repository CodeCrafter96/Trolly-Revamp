import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/data/categories_cube.dart';
import 'package:trolly_revamp/data/offer_data.dart';
import 'package:trolly_revamp/data/sub_products_data.dart';
import 'package:trolly_revamp/presentation/pages/product_details.dart';
import 'package:trolly_revamp/presentation/widgets/category_cards.dart';
import 'package:trolly_revamp/presentation/widgets/offer_card.dart';
import 'package:trolly_revamp/presentation/widgets/search_box.dart';
import 'package:trolly_revamp/presentation/widgets/sub_product.dart';
import 'package:trolly_revamp/presentation/widgets/sub_product_card.dart';
import 'package:trolly_revamp/utils/colors.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<bool> cardSelected = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Grocery",
            style: GoogleFonts.hindMadurai(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const SearchBox(),
            Expanded(
              child: Container(
                // color: Colors.amberAccent,
                child: Row(
                  children: [
                    buildSubProductList(),
                    Expanded(child: buildProductGridView()),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            buildBottomScreen(context);
          },
          backgroundColor: AppColors.orange,
          shape: CircleBorder(),
          child: Image.asset(
            filterIC,
            fit: BoxFit.cover,
            height: 24,
          ),
        ),
      ),
    );
  }

  Widget buildSubProductList() {
    return Container(
      width: 88,
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
      padding: const EdgeInsets.only(top: 16),
      child: RawScrollbar(
        thickness: 2,
        thumbColor: AppColors.orange,
        trackVisibility: true,
        radius: Radius.circular(6),
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: sub_products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: SubProductCard(
                  subProducts: sub_products[index],
                ),
              );
            }),
      ),
    );
  }

  Widget buildProductGridView() {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        left: 8,
        right: 8,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          mainAxisExtent: 250,
        ),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: todaysOffer.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProductDetails(),
                  ),
                );
              },
              child: SubProduct(offerData: todaysOffer[index]));
        },
      ),
    );
  }

  void buildBottomScreen(context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                color: Colors.pinkAccent,
              ),
              SvgPicture.asset(
                closeBtnIC,
                fit: BoxFit.cover,
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget buildBottomScreen() {
  //   return BottomSheet(
  //     onClosing: () {},
  //     builder: (context) {
  //       return Container(
  //         decoration: const BoxDecoration(
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(32),
  //             topRight: Radius.circular(32),
  //           ),
  //         ),
  //         child: Stack(
  //           children: [
  //             Container(
  //               margin: const EdgeInsets.only(top: 16),
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
