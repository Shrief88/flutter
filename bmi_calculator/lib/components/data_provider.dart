import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constant.dart';
import 'round_button.dart';

class DataProvider extends StatelessWidget {
  final String label;
  final int value;
  final RoundButton rightIcon;
  final RoundButton leftIcon;

  DataProvider(
      {required this.label,
      required this.value,
      required this.leftIcon,
      required this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelText,
        ),
        Text(
          value.toString(),
          style: kNumberText,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            leftIcon,
            SizedBox(
              width: kSizedBoxHeight,
            ),
            rightIcon,
          ],
        )
      ],
    );
  }
}
