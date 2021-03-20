import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:idiomclient/protos/user.pb.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/screens/add_idiom_page.dart';
import 'package:idiomclient/screens/favorites_page.dart';
import 'package:idiomclient/screens/profile_page.dart';
import 'package:idiomclient/screens/idiom_list_page.dart';
import 'package:idiomclient/screens/registration_page.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:idiomclient/services/user_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/idiom_list_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  runApp(ProviderScope(child: MyApp()));
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
        primaryColor: Colors.grey[700],
        accentColor: Colors.lightBlue[300],
        buttonColor: Colors.grey[400],
        dividerColor: Colors.grey[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
            headline1: const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headline4: const TextStyle(fontSize: 28.0, fontFamily: 'Open Sans'),
            subtitle1: TextStyle(fontSize: 16, color: Colors.red[500], height: 1.0),
            headline6: TextStyle(fontSize: 24.0, fontFamily: 'Open Sans', color: Colors.grey[400]),
            headline3: TextStyle(fontSize: 20.0, fontFamily: 'Open Sans', color: Colors.grey[400]),
            bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind', color: Colors.grey[400]),
            button: TextStyle(
                fontSize: 18.0,
                fontFamily: 'Hind',
                color: Colors.grey[800],
                fontWeight: FontWeight.w500),
            headline5: TextStyle(
                fontFamily: "Nexa",
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 24)),
      ),
      home: Consumer(builder: (_, watch, __) {
        final provider = watch(authorizationProvider);
        if (provider.isLoading) {
          return const CircularProgressIndicator();
        } else {
          if (provider.isAuthorized) {
            return const MyHomePage();
          }
          return const RegistrationPage();
        }
      }),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Builder(builder: (context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (tabController.indexIsChanging &&
              tabController.index == 3 &&
              tabController.offset <= -1) {
            context.read(profileProvider).getProfile();
          }
        });
        return Scaffold(
          bottomNavigationBar: SizedBox(
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
                  labelPadding: const EdgeInsets.only(top: 5, bottom: 5),
                  indicatorWeight: 0,
                  tabs: const <Widget>[
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
                  indicator: const UnderlineTabIndicator(borderSide: BorderSide(width: 0)),
                  unselectedLabelColor: Colors.grey[400],
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            children: const <Widget>[
              IdiomListPage(),
              AddIdiomPage(),
              FavoritesPage(),
              ProfilePage(),
            ],
          ),
        );
      }),
    );
  }
}
