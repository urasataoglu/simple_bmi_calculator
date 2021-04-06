import 'package:flutter/material.dart';
import '../swap_color.dart';

class RoundButton extends StatelessWidget {
  RoundButton({this.icon, this.pressButton});
  final IconData icon;
  final Function pressButton;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: colorSwap(),
      onPressed: pressButton,
    );
  }
}
