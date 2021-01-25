import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "Profile",
        icon: OMIcons.settings,
        onPressed: () {},
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
