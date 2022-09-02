import 'package:flutter/material.dart';
import 'constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.ButtonTitle});
  final Function onTap;
  final String ButtonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        child:
        Center(
          child: Text(
            ButtonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26,fontWeight: FontWeight.w400 ),
          ),
        ),
        color: pinki,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: bottomcontainerheight,

      ),
    );
  }
}