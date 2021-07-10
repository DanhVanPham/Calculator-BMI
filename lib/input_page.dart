import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_data.dart';
import 'reuseable_card.dart';

const heightContainerBottom = 80.0;
const activeBacColorCard = Color(0xff1d1e33);
const inacticeBacColorCard = Color(0xff111328);
const backgroundColorBottom = Color(0xffeb1555);
enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inacticeBacColorCard;
  Color femaleColor = inacticeBacColorCard;

  // male = 1; female = 2
  GenderType selectedGender = GenderType.male;
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
                            ? activeBacColorCard
                            : inacticeBacColorCard,
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
                            ? activeBacColorCard
                            : inacticeBacColorCard,
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
                child: ReuseableCard(colour: activeBacColorCard),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReuseableCard(colour: activeBacColorCard),
                    ),
                    Expanded(
                      child: ReuseableCard(colour: activeBacColorCard),
                    ),
                  ],
                ),
              ),
              Container(
                color: backgroundColorBottom,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: heightContainerBottom,
                child: Center(
                    child: Text(
                  'CALCULATOR YOUR BMI',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                )),
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
