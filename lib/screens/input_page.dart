import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/custom_icon.dart';
import '../components/home_page_card.dart';
import '../constants.dart';
import '../components/RoundButton.dart';
import '../swap_color.dart';
import 'results_page.dart';

enum GenderEnum { male, female }
GenderEnum selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 18;

  /*
  // 1=male 2=female (get rid of this code using ? : ternaries)

  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;


  void updateGenderCardColor(genderEnum gender) {
    if (gender == genderEnum.male) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = genderActiveCardColor;
        femaleCardColor = inactiveCardColor;
      }
    } else if (gender == genderEnum.female) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = genderActiveCardColor;
        maleCardColor = inactiveCardColor;
      }
    }
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.arrow_downward,
                color: Colors.blue,
                size: 30,
              ),
              Text(
                'Choose Your GENDER',
                style: kCardTextStyle,
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.pinkAccent,
                size: 30,
              ),
            ],
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: HomePageCard(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderEnum.male;
                    });
                  },
                  color: selectedGender == GenderEnum.male
                      ? kMaleActiveCardColor
                      : kInactiveCardColor,
                  cardChild: CustomIcon(
                    label: 'Male',
                    icon: FontAwesomeIcons.male,
                  ),
                ),
              ),
              Expanded(
                child: HomePageCard(
                  onPress: () {
                    setState(() {
                      selectedGender = GenderEnum.female;
                    });
                  },
                  color: selectedGender == GenderEnum.female
                      ? kFemaleActiveCardColor
                      : kInactiveCardColor,
                  cardChild: CustomIcon(
                    label: 'Female',
                    icon: FontAwesomeIcons.female,
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            child: HomePageCard(
                color: kHomeScreenCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'What is your HEIGHT?',
                      style: kCardTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$height',
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 14),
                          trackHeight: 6),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: kCardTextColor,
                        activeColor: colorSwap(),
                        onChanged: (double heightValue) {
                          setState(() {
                            height = heightValue.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(children: [
              Expanded(
                child: HomePageCard(
                    color: kHomeScreenCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Weight',
                              style: kCardTextStyle,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              FontAwesomeIcons.weight,
                              color: iconColorSwap(),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '$weight',
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundButton(
                                icon: FontAwesomeIcons.plus,
                                pressButton: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            RoundButton(
                                icon: FontAwesomeIcons.minus,
                                pressButton: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        )
                      ],
                    )),
              ),
              Expanded(
                child: HomePageCard(
                  color: kHomeScreenCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kCardTextStyle,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Icon(
                            FontAwesomeIcons.child,
                            color: iconColorSwap(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$age',
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundButton(
                            icon: FontAwesomeIcons.plus,
                            pressButton: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          RoundButton(
                            icon: FontAwesomeIcons.minus,
                            pressButton: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: BottomButton(
              buttonTitle: 'CALCULATE!',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BMIScreen(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      advice: calc.getAdvice(),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
