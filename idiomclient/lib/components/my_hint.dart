import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:simple_tooltip/simple_tooltip.dart';
import 'package:idiomclient/providers/providers.dart';

class MyHint extends StatefulWidget {
  final String text;
  const MyHint({Key key, this.text}) : super(key: key);

  @override
  _MyHintState createState() => _MyHintState();
}

class _MyHintState extends State<MyHint> {
  Timer timer;
  bool showHint = false;
  final double iconSize = 30;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer(builder: (_, watch, __) {
      final provider = watch(settingsProvider);
      return provider.hideTooltips
          ? SizedBox(
              width: iconSize + 12,
              height: iconSize + 12,
            )
          : SimpleTooltip(
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
                      timer = Timer(const Duration(seconds: 5), () {
                        setState(() {
                          showHint = false;
                        });
                      });
                    } else {
                      if (timer != null) {
                        timer.cancel();
                      }
                    }
                  },
                  child: Icon(
                    Icons.help_outline_outlined,
                    color: Colors.grey[600],
                    size: iconSize,
                  ),
                ),
              ),
            );
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
    }
    super.dispose();
  }
}
