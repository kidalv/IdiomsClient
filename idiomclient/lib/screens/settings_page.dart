import 'package:flutter/material.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/components/my_hint.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        text: "Settings",
        disableIcon: true,
        backArrow: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
            child: Text("My Languages", style: theme.textTheme.headline5),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
            child: Text("System Language", style: theme.textTheme.headline5),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
            child: Row(
              children: [
                Text("Display Flags", style: theme.textTheme.headline5),
                MyHint(
                  text: "Show flags to represent languages",
                ),
                Switch(
                    value: true,
                    activeTrackColor: Colors.grey[700],
                    inactiveTrackColor: Colors.grey[700],
                    activeColor: theme.accentColor,
                    onChanged: (val) {})
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
            child: Row(
              children: [
                Text("Hide Tooltips", style: theme.textTheme.headline5),
                Switch(
                    value: true,
                    activeTrackColor: Colors.grey[700],
                    inactiveTrackColor: Colors.grey[700],
                    activeColor: theme.accentColor,
                    onChanged: (val) {})
              ],
            ),
          ),
          MyButton(
            text: "Change Password",
            onPress: () {},
          ),
          MyButton(
            text: "Logout",
            onPress: () {},
          )
        ],
      ),
    );
  }
}
