import 'package:flutter/material.dart';
import 'package:route_transitions/helpers/route_transitions.dart';
import 'package:route_transitions/pages/page2.dart';

class Page1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('Page 1'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () {
            RouteTransitions(context: context, child: Page2Page());
          },
          child: Text('Go to Page2'),
          color: Colors.white,
        ),
      ),
    );
  }
}
