import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_data.dart';
import 'reuseable_card.dart';
import 'constants.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
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
              GestureDetector(
                child: Container(
                  color: kBackgroundColorBottom,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: kHeightContainerBottom,
                  child: Center(
                      child: Text(
                    'CALCULATOR YOUR BMI',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  )),
                ),
              )
            ],
          ),
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.iconData, required this.onPress});

  IconData iconData;

  VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      child: Icon(iconData),
      elevation: 6.0,
      onPressed: onPress,
    );
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
