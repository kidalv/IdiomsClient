import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FrostedGlass extends StatelessWidget {
  final BorderRadius borderRadius;
  final Widget child;
  const FrostedGlass({Key key, this.borderRadius, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  border: Border.all(color: Colors.white.withOpacity(0.2), width: 1.0),
                  gradient:
                      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.1),
                  ], stops: [
                    0.0,
                    1.0,
                  ])),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
