import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';

class DropdownSearch extends StatefulWidget {
  final Map<String, String> list;
  DropdownSearch({Key key, this.list}) : super(key: key);

  @override
  _DropdownSearchState createState() => _DropdownSearchState(list);
}

class _DropdownSearchState extends State<DropdownSearch> {
  Iterable<MapEntry<String, String>> tempList;
  Map<String, String> allItems;
  Map<String, String> selectedLanguages;
  bool collapsed = true;
  _DropdownSearchState(this.allItems) {
    tempList = allItems.entries;
    selectedLanguages = Map<String, String>();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
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
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: TextField(
                          decoration: new InputDecoration(
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
                              tempList = allItems.entries.where((x) => x.key.contains(value));
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
              !collapsed
                  ? Container(
                      padding: EdgeInsets.only(left: 8.0, right: 8.0),
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Scrollbar(
                        thickness: 5,
                        radius: Radius.circular(10),
                        controller: ScrollController(),
                        child: ListView(
                          padding: EdgeInsets.only(left: 32),
                          physics: BouncingScrollPhysics(),
                          children: tempList
                              .map((e) => LanguageRow(
                                    language: e.key,
                                    code: e.value,
                                    onPress: () {
                                      setState(() {
                                        selectedLanguages[e.key] = e.value;
                                        allItems.removeWhere((key, value) => value == e.value);
                                        tempList = tempList.where((x) => x.value != e.value);
                                      });
                                    },
                                  ))
                              .toList(),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        selectedLanguages.length > 0
            ? Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text("Selected languages: "))
            : Container(),
        selectedLanguages.length > 0
            ? Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(0.1))),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: selectedLanguages.entries
                        .map((e) => InkWell(
                              onTap: () {setState(() {
                                selectedLanguages.removeWhere((x, y) => y == e.value);
                                allItems[e.key] = e.value;
                                tempList = allItems.entries;
                              });},
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                width: 44,
                                child: FlagRow(
                                  code: e.value,
                                  length: 30,
                                  flagOnly: true,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}

class LanguageRow extends StatelessWidget {
  final String language;
  final String code;
  final Function onPress;
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
