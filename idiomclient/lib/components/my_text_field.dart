import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  const MyTextField({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
      ),
      child: TextField(
        decoration: new InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 15),
            hintText: text),
      ),
    );
  }
}
