import 'package:flutter/material.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class IdiomDetailsPage extends StatelessWidget {
  const IdiomDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backArrow: true,
        text: "",
        onPressed: () {},
        icon: Icons.edit_outlined,
      ),
      body: Text(
        "Saņemt pa purnu",
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
