import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_bmi_calculator/components/bottom_button.dart';
import 'package:simple_bmi_calculator/components/home_page_card.dart';
import '../constants.dart';
import '../swap_color.dart';

class BMIScreen extends StatelessWidget {
  BMIScreen(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.advice});
  final String bmiResult;
  final String resultText;
  final String advice;
  @override
  Widget build(BuildContext context) {
    List bmiScores = [
      'BMI: Below 18.5',
      'BMI: 18.5 - 24.9',
      'BMI: 25.0 - 29.9',
      'BMI: 30.0 - 34.9',
      'BMI: 35.0 - 39.9',
      'BMI: Above 40',
    ];
    List bmiScores2 = [
      'Underweight',
      'Normal Weight',
      'Pre - Obesity',
      'Obesity Class 1',
      'Obesity Class 2',
      'Obesity Class 3',
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: colorSwap(),
        appBar: AppBar(
          backgroundColor: kHomeScreenCardColor,
          centerTitle: true,
          title: Text(
            'BMI RESULT',
            style: TextStyle(fontSize: 23, color: Colors.white70),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 25,
                  child: HomePageCard(
                      color: kInactiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(resultText.toUpperCase(),
                              style: kResultTextStyle),
                          Text(
                            bmiResult,
                            style: TextStyle(fontSize: 50, color: Colors.red),
                          ),
                          Text(
                            advice,
                            style:
                                TextStyle(fontSize: 23, color: Colors.white70),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ))),
              Divider(
                height: 10,
                indent: 1000,
                endIndent: 1000,
                thickness: 0,
                color: kHomeScreenCardColor,
              ),
              Text(
                'BMI Status Table',
                style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: kInactiveCardColor),
              ),
              Divider(
                height: 10,
                indent: 85,
                endIndent: 85,
                thickness: 1,
                color: kHomeScreenCardColor,
              ),
              Expanded(
                flex: 30,
                child: Column(
                    children: List.generate(
                  6,
                  (index) => Expanded(
                    child: Card(
                        elevation: 10.0,
                        shadowColor: Colors.yellow,
                        margin: EdgeInsets.all(10),
                        color: kHomeScreenCardColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                bmiScores[index],
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              ),
                            ),
                            Expanded(
                              child: Icon(
                                Icons.arrow_forward_sharp,
                                size: 25,
                                color: Colors.red,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                bmiScores2[index],
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 18),
                              ),
                            ),
                          ],
                        )),
                  ),
                )),
              ),
              BottomButton(
                buttonTitle: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
