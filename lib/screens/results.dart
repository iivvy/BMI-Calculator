
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:bmi_calculator/components/Reusable_card.dart';
import '../components/bottom_button.dart';
class Result extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
          Expanded(child: Container(
            alignment: Alignment.bottomLeft,

            child: Text('Your Result',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600),
            ),
            padding: EdgeInsets.only(top: 30.0,left: 5.0),

          )
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(
                colour: reusablecardcolor,
                cardChild: Column(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:<Widget> [
                    Text('OVERWEIGHT',
                      style: TextStyle(fontSize: 28,color: Color(0xFF24D876),fontWeight: FontWeight.w400),
                    ),
                    Text('40.5',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 48.0),
                    ),
                    Text('Your BMI Result is so high, lose some height you fat',
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    BottomButton(onTap:(){
                      Navigator.pop(context);
                    }, ButtonTitle:'Re-Calculate')

                  ],
                )
            ) ,

          )
        ],
      ) ,

    );
  }
}
