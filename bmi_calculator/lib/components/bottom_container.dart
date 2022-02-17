import 'package:flutter/material.dart';
import '../constant.dart';

class BottomContanier extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  BottomContanier({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(title, style: kLargeButtonStyle)),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
