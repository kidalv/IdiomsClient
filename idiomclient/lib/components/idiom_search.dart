import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/dropdown_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/providers/idiom_info_provider.dart';
import 'package:idiomclient/providers/idiom_search_provider.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/screens/idiom_info_page.dart';

final provider = ChangeNotifierProvider((x) => IdiomSearchProvider(closeOnSelect: true));

class IdiomSearch extends StatelessWidget {
  final double width;
  const IdiomSearch({Key key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    void _openDialog() {
      final info = context.read(provider);
      info.findButton();
      final currentWidth = MediaQuery.of(context).size.width;
      final left = (info.buttonPosition.dx + 51) / currentWidth;
      final sizeWidth = width / currentWidth;
      const sizeHeight = 0.5;
      Navigator.of(context)
          .push(CustomDialog(left, info.buttonPosition.dy, sizeWidth, sizeHeight));
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
                    hintText: "Search"),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    context.read(provider).findIdioms(value);
                    _openDialog();
                  }
                },
              ),
            ),
            IconButton(
              key: context.read(provider).key,
              padding: const EdgeInsets.only(left: 8, right: 15),
              splashRadius: 25,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.transparent,
                size: 30,
              ),
              onPressed: null,
            )
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends PopupRoute {
  final double leftMargin;
  final double topMargin;
  final double width;
  final double height;
  Future<bool> get _collapsed => Future<bool>.value(false);

  CustomDialog(this.leftMargin, this.topMargin, this.width, this.height);

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
                                if (value.isEmpty) {
                                  Navigator.of(context).pop();
                                } else {
                                  context.read(provider).findIdioms(value);
                                }
                              },
                            ),
                          ),
                          IconButton(
                              padding: const EdgeInsets.only(left: 8.0, right: 15.0),
                              splashRadius: 25,
                              icon: Icon(
                                Icons.close,
                                color: Colors.grey[400],
                                size: 25,
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
                          height: snapshot.data ? 0 : MediaQuery.of(context).size.height * 0.5,
                          child: !snapshot.data
                              ? dropdown.isLoading
                                  ? Align(
                                      alignment: Alignment.topCenter,
                                      child: SizedBox(
                                          height: 10,
                                          child: LinearProgressIndicator(
                                            backgroundColor: theme.scaffoldBackgroundColor,
                                          )),
                                    )
                                  : Scrollbar(
                                      thickness: 5,
                                      radius: const Radius.circular(10),
                                      controller: ScrollController(),
                                      child: ListView(
                                        padding: const EdgeInsets.only(left: 32),
                                        physics: const BouncingScrollPhysics(),
                                        children: dropdown.idioms
                                            .map((x) => IdiomRow(
                                                  idiom: x,
                                                  onPress: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => IdiomInfoPage(
                                                              idiomInfoProvider:
                                                                  ChangeNotifierProvider((ref) =>
                                                                      IdiomInfoProvider(
                                                                          x,
                                                                          ref.read(
                                                                              idiomListProvider))))),
                                                    );
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
        });
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 0);
}

class IdiomRow extends StatelessWidget {
  final IdiomReply idiom;
  final void Function() onPress;
  const IdiomRow({Key key, this.idiom, this.onPress}) : super(key: key);

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
              idiom.text,
              style: TextStyle(color: Colors.grey[400]),
            ),
            FlagRow(
              language: idiom.language,
              length: 30,
            )
          ],
        ),
      ),
    );
  }
}
