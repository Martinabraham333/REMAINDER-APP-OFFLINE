import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:remainder_app_offline/core/constants/app_colors.dart';
import 'package:remainder_app_offline/core/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String? hintText;
  final String? title;
  final IconData? icon;
  final double widthSize;
  final bool? readonly;
  final int maxLines;
  final VoidCallback? ontap;
  final Function(String)? onChanged;
  final bool isObscureText;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.title,
    this.widthSize = double.infinity,
    this.icon,
    this.readonly,
    this.ontap,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
    this.isObscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CustomText(text: title!),
        ),

        TextFormField(
          validator: validator,
          obscureText: isObscureText,
          onChanged: onChanged,
          maxLines: maxLines,
          readOnly: readonly ?? false,
          cursorColor: Colors.black,
          controller: controller,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey),
            hintText: hintText,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: ontap,
              child: Icon(icon, color: AppColors.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.red),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}