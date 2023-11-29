import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/models/offer_data.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class SubProduct extends StatelessWidget {
  const SubProduct({super.key, required this.offerData});

  final OfferData offerData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      // margin: const EdgeInsets.only(left: 8, right: 12, top: 12, bottom: 12),
      padding: const EdgeInsets.only(),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 0),
            blurRadius: 12,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                decoration: const BoxDecoration(
                  // color: Colors.blueAccent,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(235, 165, 0, 0.05),
                      Color.fromRGBO(235, 165, 0, 0),
                    ],
                  ),
                ),
                child: Image.asset(
                  offerData.productImage,
                  fit: BoxFit.cover,
                  height: 103,
                  width: 143,
                ),
              ),
              Container(
                // color: Colors.amberAccent,
                margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offerData.productName,
                      style: GoogleFonts.hindMadurai(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      offerData.productGram.toString(),
                      style: GoogleFonts.hindMadurai(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(39, 39, 39, 0.75),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'SDG${offerData.productOffSDG}',
                              style: GoogleFonts.hindMadurai(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                decoration: TextDecoration.lineThrough,
                                color: Color.fromRGBO(100, 100, 100, 1),
                              ),
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'SDG',
                                    style: GoogleFonts.hindMadurai(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromRGBO(39, 39, 39, 1),
                                    ),
                                  ),
                                  TextSpan(
                                    text: offerData.productOffer.toString(),
                                    style: GoogleFonts.hindMadurai(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(39, 39, 39, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(width: 74),
                        SvgPicture.asset(
                          cartButtonIC,
                          fit: BoxFit.cover,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          offerData.productOffer != 0
              ? Stack(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: SvgPicture.asset(
                        offerRectangleIC,
                        fit: BoxFit.cover,
                        height: 20,
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 4, top: 4),
                      child: Text(
                        '${offerData.productOffer.toString()}% Off',
                        style: GoogleFonts.hindMadurai(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
