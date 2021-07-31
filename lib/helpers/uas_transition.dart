import 'package:flutter/material.dart';

enum UasAnimation {
  native,
  fadeIn,
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
  scaleUp,
  rotateUp,
  rotateFromTopLeft,
  rotateFromTopCenter,
  rotateFromTopRight,
  rotateFromCenterLeft,
  rotateFromCenter,
  rotateFromCenterRight,
  rotateFromBottomLeft,
  rotateFromBottomCenter,
  rotateFromBottomRight,
}

enum UasSide {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight
}

class UasTransition {
  final UasAnimation animation;
  final BuildContext context;
  final Widget child;
  final Curve curves;
  final Duration duration;
  final bool replacement;

  UasTransition(
      {required this.context,
      required this.child,
      this.duration = const Duration(milliseconds: 500),
      this.animation = UasAnimation.scaleUp,
      this.curves = Curves.elasticOut,
      this.replacement = false}) {
    switch (animation) {
      case UasAnimation.native:
        _nativeTransition();
        break;
      case UasAnimation.fadeIn:
        _fadeInTransition();
        break;
      case UasAnimation.scaleUp:
        _scaleUpTransition();
        break;
      case UasAnimation.leftToRight:
        _slideTransition(UasSide.centerLeft);
        break;
      case UasAnimation.rightToLeft:
        _slideTransition(UasSide.centerRight);
        break;
      case UasAnimation.topToBottom:
        _slideTransition(UasSide.topCenter);
        break;
      case UasAnimation.bottomToTop:
        _slideTransition(UasSide.bottomCenter);
        break;
      case UasAnimation.rotateUp:
        _rotateUpTransition();
        break;
      case UasAnimation.rotateFromTopLeft:
        _rotateFromTransition(UasSide.topLeft);
        break;
      case UasAnimation.rotateFromTopCenter:
        _rotateFromTransition(UasSide.topCenter);
        break;
      case UasAnimation.rotateFromTopRight:
        _rotateFromTransition(UasSide.topRight);
        break;
      case UasAnimation.rotateFromCenterLeft:
        _rotateFromTransition(UasSide.centerLeft);
        break;
      case UasAnimation.rotateFromCenter:
        _rotateFromTransition(UasSide.center);
        break;
      case UasAnimation.rotateFromCenterRight:
        _rotateFromTransition(UasSide.centerRight);
        break;
      case UasAnimation.rotateFromBottomLeft:
        _rotateFromTransition(UasSide.bottomLeft);
        break;
      case UasAnimation.rotateFromBottomCenter:
        _rotateFromTransition(UasSide.bottomCenter);
        break;
      case UasAnimation.rotateFromBottomRight:
        _rotateFromTransition(UasSide.bottomRight);
        break;
    }
  }

  void _naviPush(Route route) => Navigator.push(context, route);

  void _naviPushRep(Route route) => Navigator.pushReplacement(context, route);

  void _nativeTransition() {
    final route = MaterialPageRoute(builder: (_) => child);
    return replacement ? _naviPushRep(route) : _naviPush(route);
  }

  void _fadeInTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, ___) => FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0)
                .animate(CurvedAnimation(parent: animation, curve: curves)),
            child: child));
    return replacement ? _naviPushRep(route) : _naviPush(route);
  }

  void _scaleUpTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        transitionsBuilder: (_, animation, __, ___) => FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(parent: animation, curve: curves)),
              child: ScaleTransition(
                  scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(parent: animation, curve: curves)),
                  child: child),
            ));
    return replacement ? _naviPushRep(route) : _naviPush(route);
  }

  void _rotateFromTransition(UasSide side) {
    Alignment alignment;
    switch (side) {
      case UasSide.topLeft:
        alignment = Alignment.topLeft;
        break;
      case UasSide.topCenter:
        alignment = Alignment.topCenter;
        break;
      case UasSide.topRight:
        alignment = Alignment.topRight;
        break;
      case UasSide.centerLeft:
        alignment = Alignment.centerLeft;
        break;
      case UasSide.center:
        alignment = Alignment.center;
        break;
      case UasSide.centerRight:
        alignment = Alignment.centerRight;
        break;
      case UasSide.bottomLeft:
        alignment = Alignment.bottomLeft;
        break;
      case UasSide.bottomCenter:
        alignment = Alignment.bottomCenter;
        break;
      case UasSide.bottomRight:
        alignment = Alignment.bottomRight;
    }

    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      transitionsBuilder: (_, animation, __, ___) => FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(parent: animation, curve: curves)),
        child: RotationTransition(
            alignment: alignment,
            turns: Tween<double>(begin: 0.5, end: 1.0)
                .animate(CurvedAnimation(parent: animation, curve: curves)),
            child: child),
      ),
    );
    return replacement ? _naviPushRep(route) : _naviPush(route);
  }

  void _rotateUpTransition() {
    final route = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        transitionsBuilder: (_, animation, __, ___) => ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0)
                  .animate(CurvedAnimation(parent: animation, curve: curves)),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.0, end: 1.0)
                    .animate(CurvedAnimation(parent: animation, curve: curves)),
                child: RotationTransition(
                    turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(parent: animation, curve: curves)),
                    child: child),
              ),
            ));
    return replacement ? _naviPushRep(route) : _naviPush(route);
  }

  void _slideTransition(UasSide originSide) {
    final dx = originSide == UasSide.centerLeft
        ? -1.0
        : originSide == UasSide.centerRight
            ? 1.0
            : 0.0;

    final dy = originSide == UasSide.topCenter
        ? -1.0
        : originSide == UasSide.bottomCenter
            ? 1.0
            : 0.0;

    final route = PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionDuration: duration,
        transitionsBuilder: (_, animation, __, ___) => SlideTransition(
            position: Tween<Offset>(begin: Offset(dx, dy), end: Offset(0, 0))
                .animate(CurvedAnimation(parent: animation, curve: curves)),
            child: child));

    return replacement ? _naviPushRep(route) : _naviPush(route);
  }
}
