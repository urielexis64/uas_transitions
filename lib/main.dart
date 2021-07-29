import 'package:flutter/material.dart';
import 'package:route_transitions/pages/page1.dart';
import 'package:route_transitions/pages/page2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'page1',
      routes: {
        'page1': (_) => Page1Page(),
        'page2': (_) => Page2Page(),
      },
    );
  }
}
