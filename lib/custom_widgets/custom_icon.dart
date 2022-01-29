import '../constants/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double degree;
  const CustomIcon(this.degree, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        child: Transform.rotate(
            angle: degree * math.pi / 180,
            child: Icon(
              icon,
              color: primary,
            )),
        height: 40.0,
        width: 40,
        margin: const EdgeInsets.only(bottom: 6.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
      ),
    );
  }
}
