import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/screens/idiom_details_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class IdiomListPage extends StatelessWidget {
  const IdiomListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  padding: EdgeInsets.only(top: 30, left: 10, bottom: 8),
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Text("Sort by"),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(Icons.calendar_today_outlined, color: Colors.grey[400]),
                      onPressed: () {}),
                  IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.arrow_drop_up,
                        color: Colors.grey[400],
                        size: 45,
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.grey[400]), onPressed: () {}),
                  IconButton(
                    icon: Icon(Icons.translate, color: Colors.grey[400]),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.comment_outlined, color: Colors.grey[400]),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Text("Languages: "),
            Container(
              margin: EdgeInsets.all(10),
              child: DropdownSearch())
          ],
        ),
      ),
      appBar: MyAppBar(
        text: "Idioms",
        iconButton: Builder(
          builder: (context) => IconButton(
              icon: Icon(
                Icons.filter_alt_outlined,
                size: 35,
                color: Colors.grey[400],
              ),
              splashRadius: 25,
              onPressed: () => Scaffold.of(context).openEndDrawer()),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IdiomDetailsPage()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
              margin: EdgeInsets.only(left: 10, right: 10),
              height: height * 0.25,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_drop_up_outlined,
                        size: 60,
                        color: Colors.grey[400],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Text("15",
                            style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: height * 0.185,
                          child: Center(
                            child: Text(
                              "Saņemt pa purnu",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 5.0),
                          width: width - 20 - 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  OMIcons.favoriteBorder,
                                  size: 35,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text("10",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: Icon(
                                  Icons.translate_outlined,
                                  size: 30,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text("2",
                                    style: TextStyle(
                                        color: Colors.grey[400],
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500)),
                              ),
                              FlagRow(code: 'LV',)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
            margin: EdgeInsets.only(left: 10, right: 10),
            height: height * 0.25,
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_drop_up_outlined,
                      //MdiIcons.arrowUpBoldOutline,
                      size: 60,
                      color: Colors.grey[400],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Text("12",
                          style: TextStyle(
                              color: Colors.grey[400], fontSize: 18, fontWeight: FontWeight.w500)),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height * 0.185,
                        child: Center(
                          child: Text(
                            "Nu jobanijs v rots",
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 5),
                        width: width - 20 - 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Icon(
                                OMIcons.favoriteBorder,
                                size: 30,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text("9",
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5.0),
                              child: Icon(
                                Icons.translate_outlined,
                                size: 30,
                                color: Colors.grey[400],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Text("2",
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ),
                            FlagRow(code: 'RU')
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
