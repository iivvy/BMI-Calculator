import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Icon_content.dart';
import '../components/Reusable_card.dart';
import '../components/constants.dart';
import '../main.dart';
import 'results.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecardcolor = inactivecardcolor;
  Color femalecardcolor = inactivecardcolor;
  Gender gender;
  int height = 180;
  int weight = 40;
  int age = 18;

  //0=>male , 1=> female
  // void update_color(Gender gender) {
  //   if (gender == Gender.male) {
  //     if (malecardcolor == inactivecardcolor) {
  //       malecardcolor = reusablecardcolor;
  //       femalecardcolor = inactivecardcolor;
  //     } else {
  //       malecardcolor = inactivecardcolor;
  //     }
  //   }
  //   if (gender == Gender.female) {
  //     if (femalecardcolor == inactivecardcolor) {
  //       femalecardcolor = reusablecardcolor;
  //       malecardcolor = inactivecardcolor;
  //     } else {
  //       femalecardcolor = inactivecardcolor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    gender = Gender.male;
                  });
                },
                colour: gender == Gender.male
                    ? reusablecardcolor
                    : inactivecardcolor,
                cardChild: IconWidget(
                  icon: FontAwesomeIcons.mars,
                  text: 'MALE',
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                onPress: () {
                  setState(() {
                    gender = Gender.female;
                  });
                },
                colour: gender == Gender.female
                    ? reusablecardcolor
                    : inactivecardcolor,
                cardChild: IconWidget(
                  icon: FontAwesomeIcons.venus,
                  text: 'FEMALE',
                ),
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: reusablecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: textstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: label,
                        ),
                        Text(
                          'cm',
                          style: textstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: pinki,
                          thumbColor: pinki,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0)),
                      child: Slider(
                        value: height.toDouble(),
                        min: 100.0,
                        max: 240.0,
                        //activeColor:Colors.white ,
                        inactiveColor: Color(0xFF8D8E98),

                        onChanged: (double newVal) {
                          print(newVal);
                          setState(() {
                            height = newVal.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        Expanded(
            child: Row(
          children: <Widget>[
            Expanded(
              child: ReusableCard(
                colour: reusablecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "WEIGHT",
                      style: textstyle,
                    ),
                    Text(
                      weight.toString(),
                      style: label,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: reusablecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "AGE",
                      style: textstyle,
                    ),
                    Text(
                      age.toString(),
                      style: label,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        )),
        BottomButton(ButtonTitle: "Calculate Your BMI",
          onTap:(){
          Calculator calc= Calculator(height: height , weight: weight);

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> Result(bmires: calc.CalculateBmi(),intep: calc.Interpretation(),restext: calc.results(),)));
        },),
      ]),
    );
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 4.0,
    );
  }
}
