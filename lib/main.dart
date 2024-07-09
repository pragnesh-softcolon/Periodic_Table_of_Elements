import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ElementsApp.dart';

const kRowCount = 10;
const kContentSize = 64.0;
const kGutterWidth = 2.0;
const kGutterInset = EdgeInsets.all(kGutterWidth);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List<dynamic> gridList =
  await rootBundle.loadString('assets/elementsGrid.json').then((value) {
    List<dynamic> elements = jsonDecode(value);
    return elements.map((element) {
      if (element != null) {
        element['colors'] = (element['colors'] as List<dynamic>)
            .map((color) => Color(color))
            .toList();
      }
      return element;
    }).toList();
  });
  runApp(ElementsApp(gridList));
}




