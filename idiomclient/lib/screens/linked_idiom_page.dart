import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/components/dropdown_search_new.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/idiom_search_dialog.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/models/idiom_link.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/providers/idiom_link_provider.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class LinkedIdiomPage extends StatelessWidget {
  const LinkedIdiomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: MyAppBar(
        text: "Linked Idiom",
        disableIcon: true,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 10, left: 10),
                        child: Text(
                          "Idiom",
                          style: theme.textTheme.headline5,
                        )),
                  ),
                  MyTextField(
                    text: "Idiom Text",
                    controller: context.read(linkedIdiomProvider).textController,
                    maxLinesAddition: 2,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 5, left: 10),
                      child: Text(
                        "Language: ",
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  Consumer(builder: (_, watch, __) {
                    final provider = watch(linkedIdiomProvider);
                    return provider.language != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 40.0, top: 20.0, right: 20),
                            child: UserLanguageLine(
                              language: provider.language,
                            ))
                        : Container(
                            height: 70,
                          );
                  }),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Meaning",
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  MyTextField(
                    text: "Meaning",
                    controller: context.read(linkedIdiomProvider).meaningController,
                    maxLinesAddition: 3,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Example",
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  MyTextField(
                    text: "Example",
                    controller: context.read(linkedIdiomProvider).usageController,
                    maxLinesAddition: 3,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 5.0, bottom: 50),
                        child: Consumer(builder: (_, watch, __) {
                          final provider = watch(linkedIdiomProvider);
                          return MyButton(
                            width: width * 0.3,
                            height: 50,
                            text: "Add Linked Idiom",
                            disabled: !provider.buttonAvailable(),
                            onPress: () async {
                              await provider.saveIdiom();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                behavior: SnackBarBehavior.floating,
                                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                                shape:
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                content: Text('Linked idiom added!', style: theme.textTheme.headline2),
                                backgroundColor: Colors.green[800],
                                duration: const Duration(seconds: 3),
                              ));
                              Navigator.of(context).pop();
                            },
                          );
                        }),
                      ))
                ],
              ),
              Consumer(builder: (_, watch, __) {
                final provider = watch(linkedIdiomProvider);
                return Positioned(
                        top: 150,
                        left: width * 0.35,
                        child: DropdownSearchNew(
                          width: width * 0.6,
                          provider: provider.changeNotifier
                        ),
                      );
              })
            ],
          ),
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
            splashRadius: 20,
            icon: const Icon(Icons.cancel_rounded, size: 35),
            onPressed: () {
              context.read(linkedIdiomProvider).removeLanguage();
            },
            color: theme.buttonColor)
      ],
    );
  }
}
