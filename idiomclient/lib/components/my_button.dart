import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class MyButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final bool disabled;
  final double width;
  final double height;
  final bool isLoading;
  const MyButton({Key key, this.onPress, this.text, this.disabled = false, this.width, this.height, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isLoading) LoadingIndicator(widgetWidth: width + 10, widgetHeight: height + 10,),
        Material(
          clipBehavior: Clip.hardEdge,
          color: !disabled ? theme.buttonColor : theme.primaryColor,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            splashColor: theme.accentColor,
            onTap: !disabled ? onPress : null,
            child: SizedBox(
              width: width,
              height: height,
              child: Center(child: Text(text, style: theme.textTheme.button)),
            ),
          ),
        ),
      ],
    );
  }
}