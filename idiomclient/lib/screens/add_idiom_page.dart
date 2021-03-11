import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/idiom_search_dialog.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class AddIdiomPage extends StatelessWidget {
  const AddIdiomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    _showDialog() {
      showDialog(
          context: context,
          builder: (_) => Dialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: theme.scaffoldBackgroundColor,
                child: IdiomSearchDialog()
              ));
    }

    return Scaffold(
      appBar: MyAppBar(
        text: "New Idiom",
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
                  MyTextField(text: "Idiom Text", controller: context.read(addIdiomProvider).textController),
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
                    final provider = watch(addIdiomProvider);
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
                  MyTextField(text: "Meaning", controller: context.read(addIdiomProvider).meaningController),
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
                  MyTextField(text: "Example", controller: context.read(addIdiomProvider).usageController),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 10, bottom: 10),
                      child: Text(
                        "Links",
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: MyButton(
                      width: width - 50,
                      height: 50,
                      text: "Link Idiom",
                      onPress: _showDialog,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30.0, right: 5.0),
                        child: Consumer(builder: (_, watch, __) {
                          final provider = watch(addIdiomProvider);
                          return MyButton(
                            width: width * 0.3,
                            height: 50,
                            text: "Add Idiom",
                            disabled: !provider.buttonAvailable(),
                            isLoading: provider.saving,
                            onPress: provider.saveIdiom,
                          );
                        }),
                      ))
                ],
              ),
              Consumer(builder: (_, watch, __) {
                final provider = watch(addIdiomProvider);
                return Positioned(
                  top: 150,
                  left: width * 0.35,
                  child: DropdownSearch(
                    list: SharedPrefs().languages,
                    selectedList: provider.language != null ? [provider.language] : [],
                    width: width * 0.75,
                    onSelect: (x) {
                      provider.language = x;
                    },
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
            splashRadius: 20,
            icon: const Icon(Icons.cancel_rounded, size: 35),
            onPressed: () {
              context.read(addIdiomProvider).removeLanguage();
            },
            color: theme.buttonColor)
      ],
    );
  }
}
