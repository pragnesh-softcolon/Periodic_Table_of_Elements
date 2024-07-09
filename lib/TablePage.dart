import 'package:flutter/material.dart';
import 'main.dart';
import 'ElementTile.dart';

class TablePage extends StatelessWidget {
  final List<dynamic> gridList;

  TablePage(this.gridList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: const Text('Periodic Table of Elements',style: TextStyle(
          decoration: TextDecoration.underline,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Center(child: _buildTable(gridList)),
    );
  }

  Widget _buildTable(List<dynamic> elements) {
    List<Widget> tiles_demo = [];
    final tiles = elements.map((element) {
      if (element != null) {
        print('Displaying element number: ${element['number']}');
        tiles_demo.add(ElementTile(element));
        return ElementTile(element);
        // Empty box for null elements
      } else {
        return Container(color: Colors.black38, margin: kGutterInset);
      }
    }).toList();
    return SingleChildScrollView(
      child: Container(
        height: kRowCount * (kContentSize + (kGutterWidth * 2)),
        width: kRowCount * (kContentSize + (kGutterWidth * 2)) * 1.8,
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: kRowCount,
          children: tiles,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}