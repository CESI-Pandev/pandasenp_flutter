import 'package:flutter/material.dart';

class FadeWidget extends StatelessWidget {
  final Widget child;
  const FadeWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.transparent, Colors.purple],
          stops: [0.0, 0.5, 1.0], // 10% purple, 50% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: child,
    );
  }
}
