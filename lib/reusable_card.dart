import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget cardChild;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: inactiveCardColor,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}