import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class AddIdiomPage extends StatelessWidget {
  const AddIdiomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        text: "New Idiom",
        disableIcon: true,
        onPressed: () {},
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 10, left: 10),
                  child: Text(
                    "Idiom",
                    style: theme.textTheme.headline5,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: MyTextField(text: "Idiom Text"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20, left: 10),
                    child: Text(
                      "Language: ",
                      style: theme.textTheme.headline5,
                    ),
                  ),
                ),
                const FlagRow(code: "LV")
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Meaning",
                  style: theme.textTheme.headline5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: MyTextField(text: "Meaning"),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Example",
                  style: theme.textTheme.headline5,
                ),
              ),
            ),
            MyTextField(text: "Example"),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, right: 5.0),
                child: MyButton(width: width * 0.3, height: 50, text: "Add Idiom",),
              ))
          ],
        ),
      ),
    );
  }
}
