import 'package:flutter/material.dart';
import 'package:trolly_revamp/utils/colors.dart';

class ButtonDesign extends StatelessWidget {
  const ButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
