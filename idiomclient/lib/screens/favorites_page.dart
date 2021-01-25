import 'package:flutter/material.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        text: "Favorites",
        icon: Icons.filter_alt_outlined,
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