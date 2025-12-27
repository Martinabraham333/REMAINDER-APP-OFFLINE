import 'package:flutter/material.dart';


class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  final Color color;
  const CustomIcon({super.key, required this.icon, required this.onTap,  this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: color),
    );
  }
}