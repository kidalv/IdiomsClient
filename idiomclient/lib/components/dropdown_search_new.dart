import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/dropdown_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownSearchNew extends StatelessWidget {
  final double width;
  final ChangeNotifierProvider<DropdownProvider> provider;
  const DropdownSearchNew({Key key, this.width, this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _openDialog() {
      final info = context.read(provider);
      info.findButton();
      final currentWidth = MediaQuery.of(context).size.width;
      final left = (info.buttonPosition.dx + 47) / currentWidth;
      final sizeWidth = width / currentWidth;
      final sizeHeight = 0.3;
      Navigator.of(context)
          .push(CustomDialog(provider, left, info.buttonPosition.dy, sizeWidth, sizeHeight));
    }

    return Material(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.grey[400],
                size: 25,
              ),
            ),
            SizedBox(
              width: width - 94,
              child: TextField(
                style: theme.textTheme.bodyText2,
                controller: context.read(provider).searchController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "language"),
                onTap: () {
                  _openDialog();
                },
                onChanged: (value) {
                  _openDialog();
                },
              ),
            ),
            IconButton(
                key: context.read(provider).key,
                padding: const EdgeInsets.only(left: 8, right: 15),
                splashRadius: 25,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey[400],
                  size: 30,
                ),
                onPressed: () {
                  _openDialog();
                })
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends PopupRoute {
  final ChangeNotifierProvider<DropdownProvider> provider;
  final double leftMargin;
  final double topMargin;
  final double width;
  final double height;
  Future<bool> get _collapsed => Future<bool>.value(false);

  CustomDialog(this.provider, this.leftMargin, this.topMargin, this.width, this.height);

  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return _builder(context);
  }

  Widget _builder(BuildContext context) {
    final double currentWidth = MediaQuery.of(context).size.width;
    final double currentHeight = MediaQuery.of(context).size.height;
    final double resultWidth = currentWidth * width;
    final double resultHeight = currentHeight * height + 45;
    final double resultLeftMargin = currentWidth * leftMargin;
    final theme = Theme.of(context);
    return FutureBuilder<bool>(
          future: _collapsed,
          initialData: true,
          builder: (context, snapshot) {
        return Container(
            margin: EdgeInsets.only(
                left: resultLeftMargin - resultWidth,
                top: topMargin - 5,
                right: currentWidth - resultLeftMargin,
                bottom: currentHeight - topMargin - resultHeight),
            width: resultWidth,
            height: resultHeight,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: snapshot.data ? 0 : 6,
              child: Container(
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
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
                        SizedBox(
                          width: resultWidth - 94,
                          child: TextField(
                            autofocus: true,
                            style: theme.textTheme.bodyText2,
                            controller: context.read(provider).searchController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "language"),
                            onChanged: (value) {
                              context.read(provider).notifyListeners();
                            },
                            onSubmitted: (value) {},
                          ),
                        ),
                        IconButton(
                            padding: const EdgeInsets.only(left: 8.0, right: 15.0),
                            splashRadius: 25,
                            icon: Icon(
                              Icons.arrow_drop_up,
                              color: Colors.grey[400],
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                    Consumer(builder: (_, watch, __) {
                      final dropdown = watch(provider);
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        width: resultWidth,
                        height: snapshot.data ? 0 : MediaQuery.of(context).size.height * 0.3,
                        child: !snapshot.data
                            ? Scrollbar(
                                thickness: 5,
                                radius: const Radius.circular(10),
                                controller: ScrollController(),
                                child: ListView(
                                  padding: const EdgeInsets.only(left: 32),
                                  physics: const BouncingScrollPhysics(),
                                  children: dropdown
                                      .getTempList()
                                      .map((x) => LanguageRow(
                                            language: x,
                                            onPress: () {
                                              dropdown.selectLanguage(x);
                                              if (dropdown.closeOnSelect) {
                                                Navigator.of(context).pop();
                                              }
                                            },
                                          ))
                                      .toList(),
                                ),
                              )
                            : Container(),
                      );
                    }),
                  ],
                ),
              ),
            ));
      }
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 0);
}

class LanguageRow extends StatelessWidget {
  final LanguageReply language;
  final void Function() onPress;
  const LanguageRow({Key key, this.language, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.only(right: 8.0, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language.name,
              style: TextStyle(color: Colors.grey[400]),
            ),
            FlagRow(
              language: language,
              length: 30,
            )
          ],
        ),
      ),
    );
  }
}
