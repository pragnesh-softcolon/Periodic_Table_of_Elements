import 'package:flutter/material.dart';

import 'TablePage.dart';

class ElementsApp extends StatelessWidget {
  final List<dynamic> gridList;

  ElementsApp(this.gridList);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      brightness: Brightness.dark,
      hintColor: Colors.grey,
      textTheme:
      Typography.whiteMountainView.apply(fontFamily: 'Roboto Condensed'),
      primaryTextTheme:
      Typography.whiteMountainView.apply(fontFamily: 'Share Tech Mono'),
    );

    return MaterialApp(
      title: 'Periodic Table of Elements',
      theme: theme,
      home: TablePage(gridList),
      debugShowCheckedModeBanner: false,
    );
  }
}