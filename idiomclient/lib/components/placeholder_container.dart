import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class PlaceholderContainer extends StatefulWidget {
  final double width;
  final double height;
  const PlaceholderContainer({Key key, this.width, this.height}) : super(key: key);

  @override
  _PlaceholderContainerState createState() => _PlaceholderContainerState();
}

class _PlaceholderContainerState extends State<PlaceholderContainer> {
  Color color = Colors.grey[600];
  bool change = true;
  Timer firstTimer;
  Timer secondTimer;

  @override
  void initState() {
    firstTimer = Timer(const Duration(milliseconds: 1), () {
      setState(() {
        color = change ? Colors.grey[800] : Colors.grey[600];
        change = !change;
        secondTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
          setState(() {
            color = change ? Colors.grey[800] : Colors.grey[600];
            change = !change;
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
    return AnimatedContainer(
      curve: Curves.easeIn,
      width: widget.width,
      height: widget.height,
      duration: const Duration(seconds: 3),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
    );
  }
}
