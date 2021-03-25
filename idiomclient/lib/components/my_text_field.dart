import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final Function(String value) onChange;
  final int minLines;
  final int maxLinesAddition;
  final int maxLength;
  final String errorText;
  final TextEditingController controller;
  final bool isPassword;
  final bool isEmail;
  final bool noErrors;
  const MyTextField(
      {Key key,
      this.text,
      this.onChange,
      this.minLines = 1,
      this.controller,
      this.maxLength = 300,
      this.errorText,
      this.isPassword = false,
      this.isEmail = false,
      this.noErrors = false,
      this.maxLinesAddition = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
          ),
          child: TextField(
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
            controller: controller,
            onChanged: onChange,
            minLines: minLines,
            maxLength: maxLength,
            enableSuggestions: !isPassword,
            autocorrect: !isPassword,
            obscureText: isPassword,
            maxLines: isPassword ? 1 : minLines + maxLinesAddition,
            style: Theme.of(context).textTheme.bodyText2,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                counterText: "",
                disabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(left: 15, bottom: 10, top: 10, right: 15),
                hintText: text),
          ),
        ),
        if(!noErrors)
        errorText != null
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(errorText, style: theme.textTheme.subtitle1),
                ),
              )
            : Container(
                height: 32,
              )
      ],
    );
  }
}
