import 'dart:async';

import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final double widgetWidth;
  final double widgetHeight;
  const LoadingIndicator({Key key, this.widgetWidth, this.widgetHeight}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
  Timer firstTimer;
  Timer secondTimer;
  AlignmentGeometry alignment = Alignment.bottomLeft;
  double width = 20;
  double height = 10;
  int position = 0;

  @override
  void initState() {
    firstTimer = Timer(const Duration(milliseconds: 1), () {
      setState(() {
        alignment = Alignment.bottomRight;
        position++;
        secondTimer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
          setState(() {
            switch (position) {
              case 0:
                alignment = Alignment.bottomRight;
                position++;
                width = 30;
                height = 10;
                break;
              case 1:
                alignment = Alignment.topRight;
                position++;
                width = 10;
                height = 20;
                break;
              case 2:
                alignment = Alignment.topLeft;
                position++;
                width = 30;
                height = 10;
                break;
              case 3:
                alignment = Alignment.bottomLeft;
                position = 0;
                width = 10;
                height = 20;
                break;
              default:
            }
          });
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    if (firstTimer != null) {
      firstTimer.cancel();
    }
    if (secondTimer != null) {
      secondTimer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
          width: widget.widgetWidth,
          height: widget.widgetHeight,
          child: AnimatedAlign(
            alignment: alignment,
            duration: const Duration(milliseconds: 400),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: width,
              height: height,
              decoration:
                  BoxDecoration(color: theme.accentColor, borderRadius: BorderRadius.circular(3)),
            ),
          )),
    );
  }
}
