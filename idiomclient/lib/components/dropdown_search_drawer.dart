import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/protos/models.pb.dart';

class DropdownSearchDrawer extends StatefulWidget {
  final List<LanguageReply> list;
  final Function() search;
  final List<LanguageReply> selectedList;
  final double width;
  const DropdownSearchDrawer({Key key, this.list, this.selectedList, this.search, this.width = 0}) : super(key: key);

  @override
  _DropdownSearchDrawerState createState() => _DropdownSearchDrawerState(list, selectedList);
}

class _DropdownSearchDrawerState extends State<DropdownSearchDrawer> {
  List<LanguageReply> tempList;
  List<LanguageReply> allItems;
  List<LanguageReply> selectedLanguages;
  bool collapsed = true;
  _DropdownSearchDrawerState(this.allItems, this.selectedLanguages) {
    tempList = allItems;
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
                      SizedBox(
                        width: widget.width == 0 ? MediaQuery.of(context).size.width * 0.40 : widget.width - 105,
                        child: TextField(
                          style: Theme.of(context).textTheme.bodyText2,
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
                height: collapsed ? 0 : MediaQuery.of(context).size.height * 0.2,
                child: !collapsed ? Scrollbar(
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
                                setState(() {
                                  selectedLanguages.add(x);
                                  allItems.remove(x);
                                  tempList = tempList.where((y) => y.name != x.name).toList();
                                });
                                widget.search();
                              },
                            ))
                        .toList(),
                  ),
                ) : Container(),
              ),
            ],
          ),
        ),
        if (selectedLanguages.isNotEmpty)
          Container(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10),
              child: const Text("Selected languages: ")),
        if (selectedLanguages.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.1))),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                children: selectedLanguages
                    .map((x) => InkWell(
                          onTap: () {
                            setState(() {
                              selectedLanguages.remove(x);
                              allItems.add(x);
                              tempList = allItems;
                            });
                            widget.search();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            width: 44,
                            child: FlagRow(
                              code: x.region,
                              length: 30,
                              flagOnly: true,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          )
      ],
    );
  }
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
