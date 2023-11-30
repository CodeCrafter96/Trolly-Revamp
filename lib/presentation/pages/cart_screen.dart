import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/data/deal_header_data.dart';
import 'package:trolly_revamp/functions/deal_cards.dart';
import 'package:trolly_revamp/presentation/widgets/button_design.dart';
import 'package:trolly_revamp/utils/colors.dart';
import 'package:trolly_revamp/utils/constatnt.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  DealCards dealCards = DealCards();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 247, 242, 1),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart (2)',
            style: GoogleFonts.hindMadurai(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildTicket(),
                  buildCheckoutBox(),
                  buildCuponBox(),
                  buildBillingDetails(),
                  buildAddressBox(),
                  dealCards.buildDealsCard(2),
                ],
              ),
            ),
            buildProceedToCheckOutBtn(),
          ],
        ),
      ),
    );
  }

  Widget buildTicket() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
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
      child: Row(
        children: [
          SvgPicture.asset(
            ticketSale,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free Delivery if order is more than EGP 50',
                  style: GoogleFonts.hindMadurai(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Minimum amount to place an order is EGP 20',
                  style: GoogleFonts.hindMadurai(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckoutBox() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Checkout',
                style: GoogleFonts.hindMadurai(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Total Items - 2',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    // color: Colors.blueAccent,
                    child: Stack(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          margin: const EdgeInsets.only(top: 5, left: 5),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 250, 238, 1),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Color.fromRGBO(255, 235, 187, 1),
                              width: 1,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(mango),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            size: 14,
                            color: Color.fromRGBO(201, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    margin: const EdgeInsets.only(top: 26),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mango Alphonso',
                          style: GoogleFonts.hindMadurai(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '6 pcs (Approx 1.2kg)',
                          style: GoogleFonts.hindMadurai(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(39, 39, 39, 0.75),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: ' EGP 199.45 ',
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'EGP ',
                                style: GoogleFonts.hindMadurai(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(39, 39, 39, 1),
                                ),
                              ),
                              TextSpan(
                                text: '99.45',
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
                  ),
                ],
              ),
              Container(
                width: 94,
                height: 32,
                margin: const EdgeInsets.only(top: 57),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color.fromRGBO(243, 243, 243, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.orange,
                      ),
                    ),
                    Text(
                      '1',
                      style: GoogleFonts.hindMadurai(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(39, 39, 39, 0.75),
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.horizontal_rule,
                        color: AppColors.orange,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCuponBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                ticketSale,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 16),
              Text(
                'Use Coupons',
                style: GoogleFonts.hindMadurai(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(39, 39, 39, 0.75),
                ),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24,
          )
        ],
      ),
    );
  }

  Widget buildBillingDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            'Billing Details',
            style: GoogleFonts.hindMadurai(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(39, 39, 39, 0.75),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Items - 2',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(39, 39, 39, 1),
                ),
              ),
              Text(
                'EGP 198.90',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(39, 39, 39, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery charge',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(39, 39, 39, 1),
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'EGP 49.50 ',
                      style: GoogleFonts.hindMadurai(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(39, 39, 39, 1),
                      ),
                    ),
                    TextSpan(
                      text: ' Free',
                      style: GoogleFonts.hindMadurai(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(121, 164, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Divider(
              color: Color.fromRGBO(39, 39, 39, 0.15),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Grand Total',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(39, 39, 39, 1),
                ),
              ),
              Text(
                'EGP 198.90',
                style: GoogleFonts.hindMadurai(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(39, 39, 39, 1),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Savings',
                style: GoogleFonts.hindMadurai(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(121, 164, 0, 1),
                ),
              ),
              Text(
                'EGP 249.50 ',
                style: GoogleFonts.hindMadurai(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(121, 164, 0, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAddressBox() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Address',
            style: GoogleFonts.hindMadurai(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          DottedBorder(
            radius: Radius.circular(4),
            color: AppColors.orange,
            dashPattern: [8, 4],
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_location_outlined,
                    color: AppColors.orange,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Add Location',
                    style: GoogleFonts.hindMadurai(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProceedToCheckOutBtn() {
    return BottomAppBar(
      child: ButtonDesign(text: 'Proceed to Checkout'),
    );
  }
}
