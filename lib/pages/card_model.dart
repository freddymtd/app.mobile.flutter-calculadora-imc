import 'package:flutter/material.dart';

class CardModel extends StatelessWidget {
  CardModel({
    required this.bgModelColor,
    this.cardChild,
  });
  final Color bgModelColor;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: bgModelColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
