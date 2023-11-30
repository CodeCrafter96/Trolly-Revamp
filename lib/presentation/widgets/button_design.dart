import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trolly_revamp/utils/colors.dart';

class ButtonDesign extends StatelessWidget {
  const ButtonDesign({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: GoogleFonts.hindMadurai(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}
