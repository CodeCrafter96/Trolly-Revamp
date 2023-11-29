import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/functions/deal_cards.dart';
import 'package:trolly_revamp/presentation/pages/home_screen.dart';
import 'package:trolly_revamp/presentation/widgets/button_design.dart';
import 'package:trolly_revamp/utils/colors.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});

  DealCards dealCards = DealCards();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 247, 242, 1),
        appBar: AppBar(
          title: Text(
            'Grocery',
            style: GoogleFonts.hindMadurai(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildProductDetils(),
                  buildAboutProduct(),
                  dealCards.buildDealsCard(),
                ],
              ),
            ),
            buildViewCartButton(),
          ],
        ),
      ),
    );
  }

  Widget buildProductDetils() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Image.asset(
            mango,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 24),
          Image.asset(
            threeDotsIC,
            fit: BoxFit.cover,
            height: 10,
          ),
          const SizedBox(height: 18),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(121, 164, 0, 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Carbide Free',
                    style: GoogleFonts.hindMadurai(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(121, 164, 0, 1),
                    ),
                  ),
                ),
                Text(
                  'Mango Alphonso',
                  style: GoogleFonts.hindMadurai(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '6 pcs (Approx 1.2kg)',
                  style: GoogleFonts.hindMadurai(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(39, 39, 39, 0.75),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EGP 199.45',
                          style: GoogleFonts.hindMadurai(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(100, 100, 100, 1),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'EGP',
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                ),
                              ),
                              TextSpan(
                                text: ' 99.',
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                ),
                              ),
                              TextSpan(
                                text: '45',
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
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
                            '15% Off',
                            style: GoogleFonts.hindMadurai(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 169,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            whiteCartIC,
                            fit: BoxFit.cover,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Add to Cart',
                            style: GoogleFonts.hindMadurai(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildAboutProduct() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Product',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(39, 39, 39, 1),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '• Description - Carbide - Free Certified. Alphonsos are loved for their sunshine yellow appearance & delightful taste and are one of the most consumed varieties in India. Alphonso mango got its name from a Portuguese general whose name was ‘Afonso de Albuquerque’. Portuguese were responsible for introducing grafting on mango trees to produce incredible varieties such as Alphonso.',
                      style: GoogleFonts.hindMadurai(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(39, 39, 39, 0.75),
                      ),
                    ),
                    TextSpan(
                      text: '\n• Shelf Life - 7 days',
                      style: GoogleFonts.hindMadurai(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(39, 39, 39, 0.75),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildViewCartButton() {
    return BottomAppBar(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
        decoration: BoxDecoration(
          color: Color.fromRGBO(235, 165, 0, 0.05),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: AppColors.orange,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              checkCartIC,
              fit: BoxFit.cover,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8),
            Text(
              'View Cart',
              style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
