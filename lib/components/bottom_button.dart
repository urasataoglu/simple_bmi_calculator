import 'package:flutter/material.dart';

import '../constants.dart';
import '../swap_color.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});
  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Container(
          child: Center(
            child: Text(
              buttonTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: kInactiveCardColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5),
            ),
          ),
          color: colorSwap(),
          width: double.infinity,
          height: kBottomBarHeight,
        ),
      ),
    );
  }
}
