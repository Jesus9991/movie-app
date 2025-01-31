import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/*
componente de animacion para toda la app
*/
class AnimatedFadeScaleComponent extends StatelessWidget {
  final Widget child;
  final Duration fadeDuration;
  final Duration scaleDuration;
  final Offset scaleBegin;
  final Offset scaleEnd;
  final Curve curve;

  const AnimatedFadeScaleComponent({
    super.key,
    required this.child,
    this.fadeDuration = const Duration(seconds: 2),
    this.scaleDuration = const Duration(seconds: 1),
    this.scaleBegin = const Offset(1.1, 1.1),
    this.scaleEnd = const Offset(1.0, 1.0),
    this.curve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return child.animate().fadeIn(duration: fadeDuration).scale(
          begin: scaleBegin,
          end: scaleEnd,
          duration: scaleDuration,
          curve: curve,
        );
  }
}
