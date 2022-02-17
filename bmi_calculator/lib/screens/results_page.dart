import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/bottom_container.dart';
import 'package:bmi_calculator/bmi_brain.dart';
// ignore_for_file: prefer_const_constructors

class ResultsPage extends StatelessWidget {
  final BmiBrain brain;

  ResultsPage({required this.brain});

  @override
  Widget build(BuildContext context) {
    String result = brain.bmiCalculate();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(left: 20, top: 15),
              child: Text('Your Results', style: kTitleStyle),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(brain.getResult().toUpperCase(), style: kResultStyle),
                  Text(result, style: kBmiResult),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text(
                      brain.getBody(),
                      style: kBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomContanier(
            title: 'Re-Calculate your BMI',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
