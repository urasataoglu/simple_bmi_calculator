import 'package:flutter/material.dart';
import '../constants.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({this.label, this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 65),
        SizedBox(height: 15),
        Text(
          label,
          style: kCardTextStyle,
        ),
      ],
    );
  }
}
