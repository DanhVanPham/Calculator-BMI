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
  GenderType selectedGender = GenderType.male;
  int height = 180, weight = 0, age = 0;
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
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Color(0xffeb1555),
                        inactiveColor: Color(0xff8d8e98),
                        onChanged: (double value) {
                          setState(() {
                            height = value.round();
                          });
                        },
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
                      fontSize: 20.0,
                    ),
                  )),
                ),
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
