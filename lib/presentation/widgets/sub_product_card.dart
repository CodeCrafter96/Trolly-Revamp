import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/models/sub_products.dart';
import 'package:trolly_revamp/utils/colors.dart';

class SubProductCard extends StatefulWidget {
  const SubProductCard({
    super.key,
    required this.subProducts,
  });

  final SubProducts subProducts;

  @override
  State<SubProductCard> createState() => _SubProductCardState();
}

class _SubProductCardState extends State<SubProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 96,
        width: 88,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          // color: widget.cardSelected
          //     ? Color.fromRGBO(235, 165, 0, 0.15)
          //     : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 6),
            Image.asset(
              widget.subProducts.productImage,
              fit: BoxFit.cover,
              height: 48,
            ),
            const SizedBox(height: 6),
            Text(
              widget.subProducts.productName,
              textAlign: TextAlign.center,
              style: GoogleFonts.hindMadurai(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
