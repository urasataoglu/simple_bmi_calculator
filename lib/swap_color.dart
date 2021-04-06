import 'package:flutter/material.dart';
import 'package:simple_bmi_calculator/screens/input_page.dart';
import 'constants.dart';

Color colorSwap() {
  return selectedGender == null
      ? kInactiveCardColor
      : selectedGender == GenderEnum.female
          ? kFemaleActiveCardColor
          : kMaleActiveCardColor;
}

Color iconColorSwap() {
  return selectedGender == null
      ? Colors.white70
      : selectedGender == GenderEnum.female
          ? Colors.pink
          : Colors.blue;
}
