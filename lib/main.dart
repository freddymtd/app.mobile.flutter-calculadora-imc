import 'package:flutter/material.dart';
import 'package:imc_calc/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF3F9FE),
        primaryColor: Colors.amber,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Color(
              0xFFFFFFFF,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Calculadora de IMC',
      home: HomePage(),
    );
  }
}
