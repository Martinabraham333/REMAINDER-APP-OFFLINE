import 'package:flutter/material.dart';
import 'package:remainder_app_offline/core/constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final double width;
  final double fontsize;
  final Color backGroundColor;
  final Color textColor;
  const CustomButton({
    super.key,
    required this.title,
    required this.ontap,
    this.width = double.infinity,
    this.backGroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,  this.fontsize=20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      decoration: BoxDecoration(
        color: backGroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: ontap,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: fontsize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}