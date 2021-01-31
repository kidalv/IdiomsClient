import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class AddIdiomPage extends StatelessWidget {
  const AddIdiomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: Text("Idiom"),
            ),
            MyTextField(
              text: "Idiom Text"
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Language: "),
                ),
                FlagRow(code: "LV")
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Meaning"),
            ),
            MyTextField(
              text: "Meaning"
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Example"),
            ),
            MyTextField(
              text: "Example"
            ),
          ],
        ),
      ),
    );
  }
}
