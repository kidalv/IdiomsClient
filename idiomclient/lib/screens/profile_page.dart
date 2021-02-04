import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/screens/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "Profile",
        icon: OMIcons.settings,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsPage()),
          );
        },
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
