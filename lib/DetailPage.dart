import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ElementTile.dart';
import 'main.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> element;

  DetailPage(this.element);

  @override
  Widget build(BuildContext context) {
    final listItems = <Widget>[
      ListTile(
          leading: Icon(Icons.category),
          title: Text(element['category'].toUpperCase())),
      ListTile(
        leading: Icon(Icons.info),
        title: Text(element['extract']),
        subtitle: InkWell(
          onTap: () async {
            //  open url in browser
            try {
              await launchUrl(Uri.parse(element['source']));
            } catch (e) {
              print(e);
            }
          },
          child: Text(
            element['source'],
            style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.fiber_smart_record),
        title: Text(element['atomic_weight']),
        subtitle: Text('Atomic Weight'),
      ),
    ].expand((widget) => [widget, Divider()]).toList();

    return Scaffold(
      backgroundColor: Color.lerp(Colors.grey[850], element['colors'][0], 0.07),
      appBar: AppBar(
        backgroundColor:
            Color.lerp(Colors.grey[850], element['colors'][1], 0.2),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kContentSize * 1.5),
          child: ElementTile(element, isLarge: true),
        ),
      ),
      body: ListView(padding: EdgeInsets.only(top: 24.0), children: listItems),
    );
  }
}
