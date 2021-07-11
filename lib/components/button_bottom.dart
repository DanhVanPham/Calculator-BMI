import 'package:flutter/material.dart';
import '../constants.dart';

class ButtonBottom extends StatelessWidget {
  ButtonBottom({required this.textButton, required this.onTap});

  String textButton;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBackgroundColorBottom,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kHeightContainerBottom,
        child: Center(
            child: Text(
          textButton,
          style: kBodyTextStyle,
        )),
      ),
    );
  }
}
