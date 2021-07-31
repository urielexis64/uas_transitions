import 'package:flutter/material.dart';
import 'package:route_transitions/helpers/uas_transition.dart';
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
        child: ShakeTransition(
          child: MaterialButton(
            onPressed: () {
              UasTransition(
                  context: context,
                  child: Page2Page(),
                  animation: UasAnimation.rotateFromBottomRight,
                  curves: Curves.ease);
            },
            child: Text('Go to Page2'),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ShakeTransition extends StatelessWidget {
  final Duration duration;
  final Widget child;
  final double offset;

  const ShakeTransition(
      {this.duration = const Duration(milliseconds: 500),
      this.offset = 100.0,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: duration,
      curve: Curves.elasticOut,
      child: child,
      builder: (context, value, child) {
        return Transform.translate(
            offset: Offset(value * offset, 0.0), child: child);
      },
    );
  }
}
