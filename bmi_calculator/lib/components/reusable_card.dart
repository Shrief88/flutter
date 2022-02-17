import 'package:flutter/material.dart';
import '../constant.dart';
// ignore_for_file: prefer_const_constructors

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  ReusableCard({required this.colour, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kCardMargin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(kBorderCardRadius),
        ),
      ),
    );
  }
}
