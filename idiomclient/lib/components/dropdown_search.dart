import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/protos/models.pb.dart';

class DropdownSearch extends StatefulWidget {
  final List<LanguageReply> list;
  final Function(LanguageReply) onSelect;
  const DropdownSearch({Key key, this.list, this.onSelect}) : super(key: key);

  @override
  _DropdownSearchState createState() => _DropdownSearchState(list);
}

class _DropdownSearchState extends State<DropdownSearch> {
  List<LanguageReply> tempList;
  List<LanguageReply> allItems;
  bool collapsed = true;
  _DropdownSearchState(this.allItems) {
    tempList = allItems;
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Material(
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
                      width: width * 0.45,
                      child: TextField(
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
                            tempList = allItems
                                .where((x) => x.name.toLowerCase().contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        onSubmitted: (value) {},
                      ),
                    ),
                  ],
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    splashRadius: 25,
                    icon: Icon(
                      collapsed ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                      color: Colors.grey[400],
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        collapsed = !collapsed;
                      });
                    })
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              width: width * 0.68,
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
                                  language: x.name,
                                  code: x.region,
                                  onPress: () {
                                    widget.onSelect(x);
                                    setState(() {
                                      allItems.remove(x);
                                      tempList = tempList.where((y) => y.name != x.name).toList();
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
    );
  }
}

class LanguageRow extends StatelessWidget {
  final String language;
  final String code;
  final void Function() onPress;
  const LanguageRow({Key key, this.language, this.code, this.onPress}) : super(key: key);

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
              language,
              style: TextStyle(color: Colors.grey[400]),
            ),
            FlagRow(
              code: code,
              length: 30,
            )
          ],
        ),
      ),
    );
  }
}
