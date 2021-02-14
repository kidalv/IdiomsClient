import 'package:flutter/material.dart';
import 'package:idiomclient/components/dropdown_search.dart';
import 'package:idiomclient/components/idiom_list_tile.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/providers/idiom_list_provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:provider/provider.dart';

class IdiomListPage extends StatelessWidget {
  const IdiomListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        endDrawer: Drawer(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                    padding: const EdgeInsets.only(top: 30, left: 10, bottom: 8),
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 35,
                      color: Colors.grey[400],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              const Text("Sort by"),
              Container(
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))
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
                        icon: Icon(Icons.favorite_border, color: Colors.grey[400]),
                        onPressed: () {}),
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
              const Text("Languages: "),
              Container(
                  margin: const EdgeInsets.all(10),
                  child: DropdownSearch(
                    list: const {
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
        body: context.watch<IdiomListProvider>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : context.watch<IdiomListProvider>().list.isEmpty
                ? Center(
                    child: MyButton(
                      text: "Refresh",
                      onPress: () =>
                          Provider.of<IdiomListProvider>(context, listen: false)..getList(),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: height * 0.6,
                        child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: context
                                .watch<IdiomListProvider>()
                                .list
                                .map((x) => IdiomListTile(idiom: x))
                                .toList()),
                      ),
                      SizedBox(
                        height: height * 0.2,
                        child: Center(
                          child: MyButton(
                            text: "Refresh",
                            onPress: () =>
                                Provider.of<IdiomListProvider>(context, listen: false)..getList(),
                          ),
                        ),
                      ),
                    ],
                  ));
  }
}
