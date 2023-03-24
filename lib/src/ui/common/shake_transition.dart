import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  const ShakeTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.offset = 150,
    this.axis = Axis.vertical,
    this.isLeft = true,
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final Duration duration;
  final double offset;
  final Axis axis;
  final bool isLeft;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 1.0, end: 0.0),
      duration: duration,
      curve: curve,
      builder: (context, value, child) {
        return
            // axis == Axis.vertical
            //     ?
            Transform.translate(
          offset: isLeft
              ? Offset(-value * offset, value * offset)
              : Offset(value * offset, -value * -offset),
          child: child,
        );
        // : Transform.translate(
        //     offset: Offset(value * offset, -value * -offset),
        //     child: child,
        //   );
      },
      child: child,
    );
  }
}
