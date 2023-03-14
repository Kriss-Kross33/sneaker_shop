import 'dart:ui';

import 'package:flutter/material.dart';

class ImageShadow extends StatelessWidget {
  final Widget child;
  final Offset offset;
  final double sigmaX;
  final double sigmaY;
  final Color color;
  const ImageShadow({
    super.key,
    required this.child,
    required this.offset,
    this.sigmaX = 0.0,
    this.sigmaY = 0.0,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: offset,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  width: 0,
                ),
              ),
              child: AnimatedOpacity(
                opacity: 0,
                duration: const Duration(milliseconds: 100),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
                  child: child,
                ),
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
