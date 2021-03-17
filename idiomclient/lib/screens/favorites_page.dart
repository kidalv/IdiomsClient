import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/dropdown_search_drawer.dart';
import 'package:idiomclient/components/idiom_list_tile.dart';
import 'package:idiomclient/components/list_tile_placeholder.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/providers/idiom_list_provider.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:idiomclient/components/my_app_bar.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
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
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
              child: Consumer(builder: (_, watch, __) {
                final provider = watch(favoritesProvider);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          color: provider.currentSort == Sort.date
                              ? theme.accentColor
                              : Colors.grey[400],
                        ),
                        onPressed: () => provider.changeSort(Sort.date)),
                    IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.arrow_drop_up_rounded,
                          color: provider.currentSort == Sort.upvotes
                              ? theme.accentColor
                              : Colors.grey[400],
                          size: 45,
                        ),
                        onPressed: () => provider.changeSort(Sort.upvotes)),
                    IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: provider.currentSort == Sort.favorites
                              ? theme.accentColor
                              : Colors.grey[400],
                        ),
                        onPressed: () => provider.changeSort(Sort.favorites)),
                    IconButton(
                      icon: Icon(
                        Icons.translate,
                        color: provider.currentSort == Sort.languages
                            ? theme.accentColor
                            : Colors.grey[400],
                      ),
                      onPressed: () => provider.changeSort(Sort.languages),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.comment_outlined,
                        color: provider.currentSort == Sort.comments
                            ? theme.accentColor
                            : Colors.grey[400],
                      ),
                      onPressed: () => provider.changeSort(Sort.comments),
                    )
                  ],
                );
              }),
            ),
            const Text("Languages: "),
            Container(
                margin: const EdgeInsets.all(10),
                child: DropdownSearchDrawer(list: SharedPrefs().languages))
          ],
        ),
      ),
      appBar: MyAppBar(
        text: "Favorites",
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
      body: Consumer(builder: (_, watch, __) {
        final provider = watch(favoritesProvider);
        if (provider.isLoading) {
          return RefreshIndicator(
            onRefresh: provider.getList,
            child: ListView(physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()), children: const [
              ListTilePlaceholder(),
              ListTilePlaceholder(),
              ListTilePlaceholder(),
              ListTilePlaceholder(),
            ]),
          );
        } else {
          if (provider.list.isEmpty) {
            return Center(
              child: MyButton(
                text: "Refresh",
                onPress: () => context.read(favoritesProvider).getList(),
              ),
            );
          } else {
            return RefreshIndicator(
              onRefresh: provider.getList,
              child: ListView(
                  physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  children: provider.list.map((x) => IdiomListTile(idiom: x)).toList()),
            );
          }
        }
      }),
    );
  }
}
