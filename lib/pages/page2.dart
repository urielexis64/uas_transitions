import 'package:flutter/material.dart';

class Page2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Page 2'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
