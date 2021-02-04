import 'package:flutter/material.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "Favorites",
        icon: MdiIcons.filterOutline,
        onPressed: () {},
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
      ),
    );
  }
}