import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:trolly_revamp/data/offer_data.dart';
import 'package:trolly_revamp/data/sub_products_data.dart';
import 'package:trolly_revamp/presentation/pages/product_details.dart';
import 'package:trolly_revamp/presentation/widgets/search_box.dart';
import 'package:trolly_revamp/presentation/widgets/sub_product.dart';
import 'package:trolly_revamp/presentation/widgets/sub_product_card.dart';
import 'package:trolly_revamp/utils/colors.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<bool> cardSelected = List.generate(10, (index) => false);

  //Bottmo Sheet variables
  bool isOpen = false;
  var bottomSheetController;

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
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
            // isOpen = true;
            // buildBottomScreen(context, isOpen);
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.black.withOpacity(0.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
              ),
              builder: (BuildContext context) {
                return buildBottomSheet();
              },
            );
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

// Bottom Sheet
  void buildBottomScreen(context, bool isOpen) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: Container(
            height: 300,
            color: isOpen ? Colors.transparent : Colors.pinkAccent,
            child: Center(
              child: Text('Here goes your data'),
            ),
          ),
        );
      },
    );
  }

  Widget buildBottomSheet() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
        Container(
          height: 100,
          width: double.infinity,
          // color: Colors.greenAccent,
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(
            right: 7,
            top: 12,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              closeBtnIC,
              fit: BoxFit.fill,
              height: 44,
              width: 44,
            ),
          ),
        ),
      ],
    );
  }
}
