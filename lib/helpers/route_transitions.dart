import 'package:flutter/material.dart';

enum Animations {
  FadeIn,
  LeftToRight,
  RightToLeft,
  TopToBottom,
  BottomToTop,
  ScaleUp,
  Rotate,
  Expand,
  Appear
}

class RouteTransitions {
  final BuildContext context;
  final Widget child;
  final Animations animation;

  RouteTransitions(
      {required this.context,
      required this.child,
      this.animation = Animations.FadeIn}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => child,
        ));
  }
}
