import 'package:flutter/material.dart';
import '../constant.dart';
// ignore_for_file: prefer_const_constructors

class GenderSelector extends StatelessWidget {
  final IconData icon;
  final String label;

  GenderSelector({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: kSizedBoxHeight,
        ),
        Text(
          label,
          style: kLabelText,
        )
      ],
    );
  }
}
