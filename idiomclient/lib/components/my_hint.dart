import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_tooltip/simple_tooltip.dart';

class MyHint extends StatefulWidget {
  final String text;
  Timer timer;
  MyHint({Key key, this.text}) : super(key: key);

  @override
  _MyHintState createState() => _MyHintState();

  @protected
  @mustCallSuper
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
  }
}

class _MyHintState extends State<MyHint> {
  bool showHint = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SimpleTooltip(
      ballonPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      show: showHint,
      tooltipTap: () {
        setState(() {
          showHint = !showHint;
        });
      },
      backgroundColor: theme.buttonColor,
      borderWidth: 0,
      arrowLength: 15,
      animationDuration: const Duration(milliseconds: 100),
      content: Text(widget.text, style: theme.textTheme.button),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              showHint = !showHint;
            });
            if (showHint) {
              widget.timer = Timer(Duration(seconds: 5), () {
                setState(() {
                  showHint = false;
                });
              });
            } else {
              if (widget.timer != null) {
                widget.timer.cancel();
              }
            }
          },
          child: Icon(
            Icons.help_outline_outlined,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
