import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/protos/models.pb.dart';

class DropdownSearch extends StatefulWidget {
  final List<LanguageReply> list;
  final Function(LanguageReply) onSelect;
  final double width;
  final List<LanguageReply> selectedList;
  const DropdownSearch({Key key, this.list, this.onSelect, this.width = 0, this.selectedList})
      : super(key: key);

  @override
  _DropdownSearchState createState() => _DropdownSearchState(list);
}

class _DropdownSearchState extends State<DropdownSearch> {
  bool collapsed = true;
  bool searchEmpty = true;
  List<LanguageReply> allItems;
  List<LanguageReply> searchedItems = [];
  final GlobalKey _key = LabeledGlobalKey("button_icon");
  Size buttonSize;
  Offset buttonPosition;
  _DropdownSearchState(this.allItems);

  findButton() {
    RenderBox renderBox = _key.currentContext.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    var tempList = widget.list;
    if (!searchEmpty) {
      tempList = searchedItems;
    }
    if (widget.selectedList != null) {
      tempList.removeWhere((x) => widget.selectedList.any((y) => y.languageId == x.languageId));
    }
    final width = widget.width == 0 ? MediaQuery.of(context).size.width : widget.width;
    final theme = Theme.of(context);
    return Material(
      borderRadius: BorderRadius.circular(10),
      elevation: collapsed ? 0 : 6,
      child: Container(
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.1))),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Icon(Icons.search, color: Colors.grey[400], size: 25,),
            ),
            SizedBox(
              width: width * 0.68 - 87,
              child: TextField(
                style: theme.textTheme.bodyText2,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "language"),
                onTap: () {
                  setState(() {
                    collapsed = false;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    searchEmpty = value == null || value == "";
                    searchedItems = widget.list
                        .where((x) => x.name.toLowerCase().contains(value.toLowerCase()))
                        .toList();
                  });
                },
                onSubmitted: (value) {},
              ),
            ),
            IconButton(
                key: _key,
                padding: const EdgeInsets.only(left: 8, right: 15),
                splashRadius: 25,
                icon: Icon(
                  collapsed ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                  color: Colors.grey[400],
                  size: 30,
                ),
                onPressed: () {
                  findButton();
                  final currentWidth = MediaQuery.of(context).size.width;
                  final left = (buttonPosition.dx + 46) / currentWidth;
                  final sizeWidth = (width * 0.68) / currentWidth;
                  final sizeHeight = 0.3;
                  Navigator.of(context).push(CustomDialog(widget.onSelect, tempList, allItems,
                      left, buttonPosition.dy, sizeWidth, sizeHeight));
                  setState(() {
                    collapsed = !collapsed;
                  });
                })
          ],
        ),
      ),
    );
  }
}

class CustomDialog extends PopupRoute {
  final Function(LanguageReply) onSelect;
  List<LanguageReply> tempList;
  final List<LanguageReply> allItems;
  final double leftMargin;
  final double topMargin;
  final double width;
  final double height;

  CustomDialog(this.onSelect, this.tempList, this.allItems, this.leftMargin, this.topMargin,
      this.width, this.height);

  @override
  Color get barrierColor => Colors.transparent;

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
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    double resultWidth = currentWidth * width;
    double resultHeight = currentHeight * height + 45;
    double resultLeftMargin = currentWidth * leftMargin;
    final theme = Theme.of(context);
    var collapsed = false;
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
          elevation: collapsed ? 0 : 6,
          child: Container(
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.1))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Icon(Icons.search, color: Colors.grey[400]),
                        ),
                        SizedBox(
                          width: resultWidth * 0.45,
                          child: TextField(
                            style: theme.textTheme.bodyText2,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "language"),
                            onTap: () {
                              setState(() {
                                collapsed = false;
                              });
                            },
                            onChanged: (value) {
                              // setState(() {
                              //   searchEmpty = value == null || value == "";
                              //   searchedItems = widget.list
                              //       .where(
                              //           (x) => x.name.toLowerCase().contains(value.toLowerCase()))
                              //       .toList();
                              // });
                            },
                            onSubmitted: (value) {},
                          ),
                        ),
                      ],
                    ),
                    // IconButton(
                    //     key: _key,
                    //     padding: EdgeInsets.zero,
                    //     splashRadius: 25,
                    //     icon: Icon(
                    //       collapsed ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                    //       color: Colors.grey[400],
                    //       size: 30,
                    //     ),
                    //     onPressed: () {
                    //       findButton();
                    //       final currentWidth = MediaQuery.of(context).size.width;
                    //       final left = buttonPosition.dx / currentWidth;
                    //       final sizeWidth = width / currentWidth;
                    //       final sizeHeight = 0.3;
                    //       Navigator.of(context).push(CustomDialog(widget.onSelect, tempList,
                    //           allItems, left, buttonPosition.dy, sizeWidth, sizeHeight));
                    //       setState(() {
                    //         collapsed = !collapsed;
                    //       });
                    //     })
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  width: resultWidth * 0.92,
                  height: collapsed ? 0 : MediaQuery.of(context).size.height * 0.3,
                  child: !collapsed
                      ? Scrollbar(
                          thickness: 5,
                          radius: const Radius.circular(10),
                          controller: ScrollController(),
                          child: ListView(
                            padding: const EdgeInsets.only(left: 32),
                            physics: const BouncingScrollPhysics(),
                            children: tempList
                                .map((x) => LanguageRow(
                                      language: x,
                                      onPress: () {
                                        onSelect(x);
                                        setState(() {
                                          allItems.remove(x);
                                          tempList =
                                              tempList.where((y) => y.name != x.name).toList();
                                        });
                                      },
                                    ))
                                .toList(),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ));
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
