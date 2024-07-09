import 'package:flutter/material.dart';

import 'DetailPage.dart';
import 'main.dart';

class ElementTile extends StatelessWidget {
  final Map<String, dynamic> element;
  final bool isLarge;

  const ElementTile(this.element, {this.isLarge = false});

  @override
  Widget build(BuildContext context) {
    final tileText = <Widget>[
      Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text('${element['number']}', style: TextStyle(fontSize: 10.0)),
      ),
      Text(element['symbol'],
          style: Theme.of(context).primaryTextTheme.bodySmall),
      Text(
        element['name'],
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: isLarge ? 0.65 : 1,
      ),
    ];
    final tile = Container(
      margin: kGutterInset,
      width: kContentSize,
      height: kContentSize,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: element['colors'].cast<Color>()),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: RawMaterialButton(
        onPressed: !isLarge
            ? () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailPage(element)),
          );
        }
            : null,
        // fillColor: Color(0xfffbc7d4),
        disabledElevation: 10.0,
        padding: kGutterInset * 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tileText,
        ),
      ),
    );

    return Hero(
      tag: 'hero-${element['symbol']}',
      flightShuttleBuilder: (_, anim, __, ___, ____) => ScaleTransition(
        scale: anim.drive(Tween(begin: 1, end: 1.75)),
        child: tile,
      ),
      child: Transform.scale(scale: isLarge ? 1.75 : 1, child: tile),
    );
  }
}