import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPress;
  final String text;
  const MyButton({Key key, this.onPress, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Material(
      clipBehavior: Clip.hardEdge,
      color: theme.buttonColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        splashColor: theme.accentColor,
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.only(top: 12, bottom: 12, left: 15, right: 15),
          child: Text(text,
              style: TextStyle(color: theme.scaffoldBackgroundColor, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
