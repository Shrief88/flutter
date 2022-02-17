import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/gender_selector.dart';
import '../components/reusable_card.dart';
import '../constant.dart';
import '../components/data_provider.dart';
import '../components/round_button.dart';
import '../components/bottom_container.dart';
import 'package:bmi_calculator/bmi_brain.dart';
// ignore_for_file: prefer_const_constructors

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  Gender? selectedGender;
  int height = 180;
  int weight = 70;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        cardChild: GenderSelector(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ),
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        cardChild: GenderSelector(
                          icon: FontAwesomeIcons.venus,
                          label: 'Female',
                        ),
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: kLabelText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberText,
                          ),
                          Text(
                            'cm',
                            style: kLabelText,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kActiveSliderColor,
                          inactiveTrackColor: KInactiveSliderColor,
                          trackHeight: 1,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: kThumbRadius,
                          ),
                          thumbColor: kThumbColor,
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: kThumbOverRelayRadius,
                          ),
                          overlayColor: kOverRelayColor,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: kMinSliderValue,
                          max: kMaxSliderValue,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: DataProvider(
                          label: 'Weight',
                          value: weight,
                          leftIcon: RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          rightIcon: RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kActiveCardColor,
                        cardChild: DataProvider(
                          label: 'Age',
                          value: age,
                          rightIcon: RoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          leftIcon: RoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BottomContanier(
                title: 'Calculate',
                onTap: () {
                  BmiBrain bmi_brain = BmiBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(brain: bmi_brain)),
                  );
                },
              )
            ],
          ),
        ));
  }
}
