import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/components/idiom_list_tile.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
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
                  //borderRadius: BorderRadius.circular(10),
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0))
                  //border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
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
                        Icons.arrow_drop_up_rounded,
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
                child: DropdownSearch(
                  list: {
                    "Latvian": "LV",
                    "Russian": "RU",
                    "English": "GB",
                    "Spanish": "ES",
                    "Lithuanian": "LT"
                  },
                ))
          ],
        ),
      ),
      appBar: MyAppBar(
        text: "Idioms",
        iconButton: Builder(
          builder: (context) => IconButton(
              icon: Icon(
                MdiIcons.filterOutline,
                size: 35,
                color: Colors.grey[400],
              ),
              splashRadius: 25,
              onPressed: () => Scaffold.of(context).openEndDrawer()),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          IdiomListTile(
            idiom: IdiomReply()
              ..text = "Saņemt pa purnu"
              ..upvoteCount = 16
              ..favoritesCount = 12
              ..language = (LanguageReply()..locale = "LV")
              ..isFavorite = true,
          ),
          IdiomListTile(
            idiom: IdiomReply()
              ..text = "Saņemt pa purnu"
              ..upvoteCount = 16
              ..favoritesCount = 12
              ..language = (LanguageReply()..locale = "LV")
              ..isFavorite = true,
          ),
          IdiomListTile(
            idiom: IdiomReply()
              ..text = "Trying to be a King, but the Ace is back"
              ..upvoteCount = 35
              ..favoritesCount = 12
              ..language = (LanguageReply()..locale = "GB")
              ..isFavorite = false,
          ),
          IdiomListTile(
            idiom: IdiomReply()
              ..text = "Слишком много сук наравят сойти за брата, хотя судьба и так на подлости богата"
              ..upvoteCount = 25
              ..favoritesCount = 23
              ..language = (LanguageReply()..locale = "RU")
              ..isFavorite = true,
          ),
        ],
      ),
    );
  }
}
