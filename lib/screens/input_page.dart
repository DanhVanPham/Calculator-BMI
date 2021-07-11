import 'package:bmi_calculator/screens/calculator_brain.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_data.dart';
import '../components/reuseable_card.dart';
import '../constants.dart';
import '../components/button_bottom.dart';
import 'package:bmi_calculator/components/round_icon.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kInacticeBacColorCard;
  Color femaleColor = kInacticeBacColorCard;

  // male = 1; female = 2
  GenderType? selectedGender;
  int height = 180, weight = 40, age = 18;
  double result = 0;
  double calculateBmi() {
    return result = weight / (height * 0.01 * 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(
                        colour: selectedGender == GenderType.male
                            ? kActiveBacColorCard
                            : kInacticeBacColorCard,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.mars,
                          label: 'MALE',
                          colour: selectedGender == GenderType.male
                              ? Colors.white
                              : Color(0xff898a94),
                        ),
                        onPress: () {
                          setState(() {
                            this.selectedGender = GenderType.male;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ReuseableCard(
                        colour: selectedGender == GenderType.female
                            ? kActiveBacColorCard
                            : kInacticeBacColorCard,
                        cardChild: IconContent(
                          iconData: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                          colour: selectedGender == GenderType.female
                              ? Colors.white
                              : Color(0xff898a94),
                        ),
                        onPress: () {
                          setState(() {
                            this.selectedGender = GenderType.female;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  colour: kActiveBacColorCard,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: kTextStyleBold,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 14),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 26),
                          thumbColor: Color(0xffeb1555),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0x29eb1555),
                          inactiveTrackColor: Color(0xff8d8e98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(
                        colour: kActiveBacColorCard,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: kTextStyleBold,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: Icons.remove,
                                  onPress: () {
                                    setState(() {
                                      if (weight > 0) {
                                        --weight;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  iconData: Icons.add,
                                  onPress: () {
                                    setState(() {
                                      ++weight;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReuseableCard(
                        colour: kActiveBacColorCard,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                'AGE',
                                style: kLabelTextStyle,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  age.toString(),
                                  style: kTextStyleBold,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  iconData: Icons.remove,
                                  onPress: () {
                                    setState(() {
                                      if (age > 0) {
                                        --age;
                                      }
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  iconData: Icons.add,
                                  onPress: () {
                                    setState(() {
                                      ++age;
                                    });
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonBottom(
                textButton: 'CALCULATOR YOUR BMI',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                                bmiResult: calc.calculateBMI(),
                                interpretation: calc.getInterpretation(),
                                resultText: calc.getResultText(),
                              )));
                },
              )
            ],
          ),
        ));
  }
}

// Container(
// margin: EdgeInsets.all(15.0),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(10.0),
// color: Color(0xff1d1e33),

// Center(
// child: Text('Body Text'),
// ),
// floatingActionButton: Theme(
//   data: ThemeData(
//     accentColor: Colors.yellowAccent,
//   ),
//   child: FloatingActionButton(
//     child: Icon(Icons.add),
//     onPressed: () => {},
//   ),
// ),
