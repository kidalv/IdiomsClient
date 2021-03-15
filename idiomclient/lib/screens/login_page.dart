import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/main.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: MyAppBar(
        text: "",
        backArrow: true,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, top: height * 0.02),
            child: Consumer(builder: (_, watch, __) {
              final provider = watch(loginProvider);
              return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
                      child: Text(
                        "Email",
                        style: theme.textTheme.headline5,
                      )),
                ),
                MyTextField(
                    text: "Email",
                    maxLength: 50,
                    isEmail: true,
                    errorText: provider.emailError,
                    controller: provider.emailController),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10, left: 10),
                      child: Text(
                        "Password",
                        style: theme.textTheme.headline5,
                      )),
                ),
                MyTextField(
                    text: "Password",
                    maxLength: 50,
                    isPassword: true,
                    errorText: provider.passwordError,
                    controller: provider.passwordController),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                  child: MyButton(
                    width: width * 0.85,
                    height: 50,
                    text: "Login",
                    disabled: !provider.loginAvailable(),
                    isLoading: provider.loginLoading,
                    onPress: () async {
                      await provider.login();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyHomePage()),
                      );
                    },
                  ),
                ),
              ]);
            }),
          )),
    );
  }
}
