import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/idiom_link_provider.dart';
import 'package:idiomclient/providers/providers.dart';

class IdiomSearchDialog extends ConsumerWidget {
  final ChangeNotifierProvider<IdiomLinkProvider> idiomLinkProvider;
  const IdiomSearchDialog(this.idiomLinkProvider, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final provider = watch(idiomLinkProvider);
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final maxHeight = height * 0.5;

    double _calculateHeight() {
      if (!provider.isLoading && provider.idioms.isNotEmpty) {
        if (provider.idioms.length < maxHeight / 50) {
          return provider.idioms.length * 50.0;
        } else {
          return maxHeight;
        }
      }
      return 0;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: width * 0.85,
      height: _calculateHeight() + 170,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
            width: width * 0.85 - 40,
            height: _calculateHeight() + 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.1))),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(Icons.search, color: Colors.grey[400]),
                    ),
                    Container(
                      width: width * 0.85 - 40 - 16 - 30 - 16 - 40,
                      child: TextField(
                        style: theme.textTheme.bodyText2,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: "idiom"),
                        controller: provider.inputController,
                        onChanged: (text) {
                          if (text != null && text != "") {
                            provider.search();
                          } else {
                            provider.close();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: IconButton(
                        splashRadius: 25,
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.close, color: Colors.grey[400]),
                        onPressed: provider.clear,
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: maxHeight == 0 ? 0 : _calculateHeight(),
                  child: provider.isOpened && provider.idioms.isNotEmpty
                      ? Scrollbar(
                          thickness: 5,
                          radius: const Radius.circular(10),
                          controller: ScrollController(),
                          child: ListView(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            children: provider.idioms
                                .map((x) => IdiomRow(
                                      idiom: x,
                                      onPress: () {provider.addIdiom(x);},
                                    ))
                                .toList(),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, bottom: 20, top: 30),
              child: MyButton(
                width: width * 0.2,
                height: 50,
                text: "Close",
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IdiomRow extends StatelessWidget {
  final IdiomReply idiom;
  final Function() onPress;
  const IdiomRow({Key key, this.idiom, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(flex: 4, child: Text(idiom.text), fit: FlexFit.tight),
            Flexible(child: FlagRow(code: idiom.language.region))
          ],
        ),
      ),
    );
  }
}
