import 'package:flutter/material.dart';
import 'package:imc_calc/constants.dart';
import 'package:imc_calc/pages/card_model.dart';
import 'package:imc_calc/pages/home_page.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.imcResult,
      required this.resultText,
      required this.message});
  final String imcResult;
  final String resultText;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Resultado',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: CardModel(
              bgModelColor: kActivateCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    imcResult,
                    style: kNumberResultStyle,
                  ),
                  Text(
                    message,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: Container(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Center(
                  child: Text(
                    'RECALCULAR',
                    style: kLargeButtonStyle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
