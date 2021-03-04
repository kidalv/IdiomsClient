import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/components/user_image.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/screens/settings_page.dart';
import 'package:idiomclient/providers/providers.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Consumer(
                    builder: (_, watch, __) {
                      final provider = watch(profileProvider);
                      return provider.isLoading
                          ? Row(
                              children: [
                                SizedBox(
                                    width: width * 0.3 - 20,
                                    child: const Center(
                                      child: PlaceholderContainer(
                                          width: 60, height: 60, borderRadius: 30),
                                    )),
                                SizedBox(
                                    width: width * 0.7 - 20,
                                    child: PlaceholderContainer(width: width * 0.4, height: 24))
                              ],
                            )
                          : Row(
                              children: [
                                SizedBox(
                                  width: width * 0.3 - 20,
                                  child: Center(
                                    child: UserImage(
                                        size: 60,
                                        user: UserReply()
                                          ..name = provider.profile.name
                                          ..userId = provider.profile.userId),
                                  ),
                                ),
                                SizedBox(
                                    width: width * 0.7 - 20, child: Text(provider.profile.name))
                              ],
                            );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, bottom: 10, left: 10),
                      child: Text(
                        "Languages",
                        style: theme.textTheme.headline5,
                      )),
                ),
                Consumer(builder: (_, watch, __) {
                  final provider = watch(profileProvider);
                  return provider.isLoading
                      ? const PlaceholderContainer(
                          width: 100,
                          height: 20,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              children: provider.profile.userLanguages
                                  .map((x) => Container(
                                        width: 70,
                                        padding: const EdgeInsets.all(8.0),
                                        child: FlagRow(
                                          code: x.region,
                                          length: 50,
                                          flagOnly: true,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        );
                })
              ],
            ),
          ),
        ));
  }
}
