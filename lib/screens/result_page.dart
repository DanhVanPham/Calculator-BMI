import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reuseable_card.dart';
import 'package:flutter/material.dart';
import '../components/button_bottom.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.resultText,
      required this.interpretation,
      required this.bmiResult});
  String interpretation, bmiResult;
  StatusBMI resultText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReuseableCard(
                  colour: kActiveBacColorCard,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        StatusBMI.overweight == resultText
                            ? 'Overweight'
                            : (StatusBMI.normal == resultText
                                ? 'Normal'
                                : 'Underweight'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: StatusBMI.overweight == resultText
                                ? Colors.redAccent
                                : (StatusBMI.normal == resultText
                                    ? Color(0XFF24D876)
                                    : Colors.yellowAccent),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        bmiResult,
                        textAlign: TextAlign.center,
                        style: kBMITextStyle,
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle,
                      ),
                    ],
                  ),
                )),
            ButtonBottom(
              textButton: 'RE-CALCULATE YOUR BMI',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
