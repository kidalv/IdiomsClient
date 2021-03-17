import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/components/my_hint.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/settings_provider.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/screens/registration_page.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: MyAppBar(
        text: "Settings",
        disableIcon: true,
        backArrow: true,
        onBack: () {
          context.read(profileProvider).getProfile();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
                  child: Text("My Languages", style: theme.textTheme.headline5),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 40.0, top: 20.0),
                  child: Text("Add", style: theme.textTheme.headline3),
                ),
                Consumer(builder: (_, watch, __) {
                  final provider = watch(settingsProvider);
                  return Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10.0, left: 40.0, top: 20.0, right: 20),
                      child: Column(
                          children: provider.userLanguages
                              .map((x) => UserLanguageLine(
                                    language: x,
                                  ))
                              .toList()));
                }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("System Language", style: theme.textTheme.headline5),
                      Consumer(builder: (_, watch, __) {
                        final provider = watch(settingsProvider);
                        return DropdownButton<String>(
                          underline: Container(),
                          iconEnabledColor: theme.buttonColor,
                          iconSize: 30,
                          onChanged: (value) =>
                              context.read(settingsProvider).setSystemLanguage(value),
                          value: provider.systemLanguage,
                          elevation: 4,
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'GB',
                              child: FlagRow(
                                code: 'GB',
                                flagOnly: true,
                                length: 35,
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'LV',
                              child: FlagRow(
                                code: 'LV',
                                flagOnly: true,
                                length: 35,
                              ),
                            ),
                            DropdownMenuItem<String>(
                              value: 'RU',
                              child: FlagRow(
                                code: 'RU',
                                flagOnly: true,
                                length: 35,
                              ),
                            )
                          ],
                        );
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Display Flags", style: theme.textTheme.headline5),
                          const MyHint(
                            text: "Show flags to represent languages",
                          ),
                        ],
                      ),
                      Consumer(builder: (_, watch, __) {
                        final provider = watch(settingsProvider);
                        return Switch(
                            value: provider.showFlags,
                            activeTrackColor: Colors.grey[700],
                            inactiveTrackColor: Colors.grey[700],
                            activeColor: theme.accentColor,
                            onChanged: (x) {
                              context.read(settingsProvider).setShowFlags(x);
                            });
                      })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hide Tooltips", style: theme.textTheme.headline5),
                      Consumer(builder: (_, watch, __) {
                        final provider = watch(settingsProvider);
                        return Switch(
                            value: provider.hideTooltips,
                            activeTrackColor: Colors.grey[700],
                            inactiveTrackColor: Colors.grey[700],
                            activeColor: theme.accentColor,
                            onChanged: (x) {
                              context.read(settingsProvider).setHideTooltips(x);
                            });
                      })
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, right: 20.0),
                    child: MyButton(
                      text: "Change Password",
                      width: width * 0.5,
                      height: 50,
                      onPress: () {},
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 20),
                    child: MyButton(
                      text: "Logout",
                      width: width * 0.5,
                      height: 50,
                      onPress: () {
                        SharedPrefs().logout();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistrationPage()),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 70,
              left: width * 0.26,
              child: Consumer(builder: (_, watch, __) {
                final provider = watch(settingsProvider);
                return DropdownSearch(
                  list: SharedPrefs().languages,
                  selectedList: provider.userLanguages,
                  onSelect: (value) {
                    context.read(settingsProvider).addLanguage(value);
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class UserLanguageLine extends StatelessWidget {
  final LanguageReply language;
  const UserLanguageLine({Key key, this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            FlagRow(
              code: language.region,
              flagOnly: true,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(language.name, style: theme.textTheme.headline3),
            ),
          ],
        ),
        IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.cancel_rounded, size: 35),
            onPressed: () {
              context.read(settingsProvider).removeLanguage(language);
            },
            color: theme.buttonColor)
      ],
    );
  }
}
