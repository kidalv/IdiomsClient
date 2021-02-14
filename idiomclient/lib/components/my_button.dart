import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  const MyButton({Key key, this.onPress, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      clipBehavior: Clip.hardEdge,
      color: theme.buttonColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        splashColor: theme.accentColor,
        onTap: onPress,
        child: Container(
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
          child: Text(text,
              style: theme.textTheme.button),
        ),
      ),
    );
  }
}
