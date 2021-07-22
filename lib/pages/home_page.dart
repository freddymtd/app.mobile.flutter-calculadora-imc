import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:imc_calc/constants.dart';
import 'package:imc_calc/pages/calculator_imc.dart';
import 'package:imc_calc/pages/card_model.dart';
import 'package:imc_calc/pages/icon_content.dart';
import 'package:imc_calc/result_page.dart';

enum Gender {
  masculino,
  feminino,
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Gender? genderSelected;

  int height = 180;
  int peso = 80;
  int idade = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.feminino;
                      });
                    },
                    child: CardModel(
                      bgModelColor: genderSelected == Gender.feminino
                          ? kActivateCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: Icons.female,
                        label: 'FEMININO',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        genderSelected = Gender.masculino;
                      });
                    },
                    child: CardModel(
                      bgModelColor: genderSelected == Gender.masculino
                          ? kActivateCardColor
                          : kInactiveCardColor,
                      cardChild: IconContent(
                        icon: Icons.male,
                        label: 'MASCULINO',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CardModel(
              bgModelColor: kActivateCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'ALTURA',
                      style: kLabelTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white.withOpacity(1),
                      inactiveTrackColor: Colors.white.withOpacity(.5),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF442E81),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CardModel(
                    bgModelColor: kActivateCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          peso.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56.0,
                                  height: 56.0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFFEB1555),
                                onPressed: () {
                                  setState(() {
                                    peso++;
                                  });
                                }),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFFEB1555),
                              onPressed: () {
                                setState(() {
                                  peso--;
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
                  child: CardModel(
                    bgModelColor: kActivateCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          idade.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                                elevation: 6.0,
                                constraints: BoxConstraints.tightFor(
                                  width: 56.0,
                                  height: 56.0,
                                ),
                                shape: CircleBorder(),
                                fillColor: Color(0xFFEB1555),
                                onPressed: () {
                                  setState(() {
                                    idade++;
                                  });
                                }),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              elevation: 6.0,
                              constraints: BoxConstraints.tightFor(
                                width: 56.0,
                                height: 56.0,
                              ),
                              shape: CircleBorder(),
                              fillColor: Color(0xFFEB1555),
                              onPressed: () {
                                setState(() {
                                  idade--;
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
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorImc calc = CalculatorImc(altura: height, peso: peso);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            imcResult: calc.calcularIMC(),
                            resultText: calc.getResult(),
                            message: calc.getInterpretation(),
                          )));
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
                    'CALCULAR IMC',
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
