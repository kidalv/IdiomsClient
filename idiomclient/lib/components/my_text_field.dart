import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final Function(String value) onChange;
  final int minLines;
  final TextEditingController controller;
  const MyTextField({Key key, this.text, this.onChange, this.minLines = 1, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        minLines: minLines,
        maxLines: minLines + 1,
        style: Theme.of(context).textTheme.bodyText2,
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 15),
            hintText: text),
      ),
    );
  }
}
