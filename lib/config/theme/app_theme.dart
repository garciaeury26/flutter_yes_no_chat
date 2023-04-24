import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(4, 99, 214, 75);
const List<Color> _colorthemes = [
  _customColor,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.pink,
  Colors.orange
];

class AppTheme {
  final int selectedColor;

  AppTheme({pSelctedColor})
  // condicion de uso 
  : assert(pSelctedColor < _colorthemes.length && pSelctedColor >= 0,'Error al aplicar el tema, no es valido'),
  selectedColor = pSelctedColor;

  ThemeData theme() {
    return ThemeData(

      brightness: Brightness.dark,// aplicar con thema oscuro
        useMaterial3: true, colorSchemeSeed: _colorthemes[selectedColor]);
  }
}
