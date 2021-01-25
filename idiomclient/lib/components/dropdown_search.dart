import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';

class DropdownSearch extends StatefulWidget {
  final List<String> list;
  DropdownSearch({Key key, this.list}) : super(key: key);

  @override
  _DropdownSearchState createState() => _DropdownSearchState();
}

class _DropdownSearchState extends State<DropdownSearch> {
  bool collapsed = true;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      onChanged: (value) {},
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
                      children: [
                        LanguageRow(language: "Latvian", code: 'LV'),
                        LanguageRow(
                          language: "Russian",
                          code: 'RU',
                        ),
                        LanguageRow(
                          language: "English",
                          code: 'GB',
                        ),
                        LanguageRow(
                          language: "Lithuanian",
                          code: 'LT',
                        ),
                        LanguageRow(language: "Spanish", code: 'ES')
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class LanguageRow extends StatelessWidget {
  final String language;
  final String code;
  const LanguageRow({Key key, this.language, this.code}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
