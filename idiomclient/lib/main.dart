import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:idiomclient/protos/user.pb.dart';
import 'package:idiomclient/screens/add_idiom_page.dart';
import 'package:idiomclient/screens/favorites_page.dart';
import 'package:idiomclient/screens/profile_page.dart';
import 'package:idiomclient/screens/idiom_list_page.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:idiomclient/services/user_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flag/flag.dart';
import 'package:provider/provider.dart';

import 'providers/idiom_list_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.lightBlue[300],
        buttonColor: Colors.grey[400],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 28.0, fontFamily: 'Open Sans'),
          headline6: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
          button:  TextStyle(fontSize: 18.0, fontFamily: 'Hind', color: Colors.grey[800], fontWeight: FontWeight.w500),
          headline5: TextStyle(fontFamily: "Nexa", color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: 24)
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<IdiomListProvider>(create: (_) => IdiomListProvider()..getList(),)
        ],
        child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // appBar: AppBar(
        //   // Here we take the value from the MyHomePage object that was created by
        //   // the App.build method, and use it to set our appbar title.
        //   title: Text(widget.title),
        // ),
        bottomNavigationBar: Container(
          height: 57,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey.withOpacity(0.1),
                height: 1,
              ),
              TabBar(
                indicatorColor: Colors.transparent,
                labelPadding: EdgeInsets.only(top: 5, bottom: 5),
                indicatorWeight: 0,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.search,
                      size: 35,
                    ),
                  ),
                  Tab(
                    icon: Icon(OMIcons.add, size: 40),
                  ),
                  Tab(
                    icon: Icon(OMIcons.favoriteBorder, size: 35),
                  ),
                  Tab(
                    icon: Icon(OMIcons.person, size: 40),
                  ),
                ],
                labelColor: Colors.lightBlue[300],
                indicator: UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
                unselectedLabelColor: Colors.grey[400],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            IdiomListPage(),
            AddIdiomPage(),
            FavoritesPage(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}