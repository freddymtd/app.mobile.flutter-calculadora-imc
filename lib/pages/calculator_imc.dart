import 'dart:math';

class CalculatorImc {
  CalculatorImc({required this.altura, required this.peso});

  final int altura;
  final int peso;

  double? _imc;

  String calcularIMC() {
    _imc = peso / pow(altura / 100, 2);
    return _imc!.toStringAsFixed(1);
  }

  String getResult() {
    if (_imc! >= 25) {
      return 'Sobrepeso';
    } else if (_imc! > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String getInterpretation() {
    String _imcFormat = _imc!.toStringAsFixed(1);
    if (_imc! >= 25) {
      return 'Sinto muito, mas o seu IMC é de $_imcFormat kg/m², por isso você está acima do peso';
    } else if (_imc! > 18.5) {
      return 'Parabéns, seu IMC é $_imcFormat kg/m² e você está dentro do peso adequado!';
    } else {
      return 'Sinto muito, seu IMC é de $_imcFormat kg/m² e você precisa ganhar peso.';
    }
  }
}
