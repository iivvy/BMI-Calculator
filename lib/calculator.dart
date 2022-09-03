
import 'dart:math';

class Calculator {
  Calculator({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi ;
  String CalculateBmi(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String results(){
    if (_bmi>=25){
      return 'Overweight';
    }else if (_bmi> 18.5){
      return 'Normal';
    }else {
      return 'Underweight';
    }
  }
  String Interpretation (){
    if (_bmi>=25){
      return 'You have a high BMI , try loosing some weight you fat ass';

    }
    else if (_bmi>=18.5){
      return 'Yaaay , you have a geat body weight';
    }
    else{
      return 'Your BMI is low, eat more';
    }
  }


}