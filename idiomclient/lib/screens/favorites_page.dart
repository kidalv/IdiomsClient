import 'package:flutter/material.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(
        text: "Favorites",
        icon: MdiIcons.filterOutline,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: height * 0.02),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
                    child: Text(
                      "Email",
                      style: theme.textTheme.headline5,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: MyTextField(text: "Email"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
                    child: Text(
                      "Password",
                      style: theme.textTheme.headline5,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: MyTextField(text: "Password"),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 10, left: 10),
                    child: Text(
                      "Repeat password",
                      style: theme.textTheme.headline5,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: MyTextField(text: "Repeat password"),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: MyButton(
                  width: width * 0.85,
                  height: 50,
                  text: "Register",
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Or",
                    style: theme.textTheme.headline5,
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.05),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  InkWell(
                      child: Container(
                    width: width * 0.40,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/google.png'), fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Google",
                            style: theme.textTheme.button,
                          )
                        ]),
                  )),
                  MyButton(
                    width: width * 0.40,
                    height: 50,
                    text: "Login",
                  )
                ]),
              )
            ]),
          )),
    );
  }
}
