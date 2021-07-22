import 'package:flutter/material.dart';
import 'package:imc_calc/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: kBodyTextContainerColor,
        ),
        SizedBox(height: 15),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
