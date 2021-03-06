import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/loading_indicator.dart';
import 'package:idiomclient/components/comment_tile.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/providers/idiom_info_provider.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class IdiomInfoPage extends StatelessWidget {
  final int idiomId;
  final ChangeNotifierProvider<IdiomInfoProvider> idiomInfoProvider;
  IdiomInfoPage({Key key, this.idiomId})
      : idiomInfoProvider = ChangeNotifierProvider((ref) => IdiomInfoProvider(idiomId)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: SpeedDial(
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 24.0),
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.6,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.favorite_border_outlined, size: 35),
              backgroundColor: Colors.pink,
              foregroundColor: Colors.white,
              labelWidget: const SpeedDialLabel(
                text: "Favorite",
                color: Colors.pink,
              ),
              onTap: () => context.read(idiomInfoProvider).addFavorite()),
          SpeedDialChild(
              child: const Icon(Icons.arrow_drop_down_rounded, size: 40),
              backgroundColor: Colors.blue[400],
              foregroundColor: Colors.white,
              labelWidget: SpeedDialLabel(
                text: "Devote",
                color: Colors.blue[400],
              ),
              onTap: () => context.read(idiomInfoProvider).addDevote()),
          SpeedDialChild(
              child: const Icon(
                Icons.arrow_drop_up_rounded,
                size: 40,
              ),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              labelWidget: const SpeedDialLabel(
                text: "Upvote",
                color: Colors.green,
              ),
              onTap: () => context.read(idiomInfoProvider).addUpvote()),
          SpeedDialChild(
              child: const Icon(Icons.error_outline, size: 35),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              labelWidget: const SpeedDialLabel(
                text: "Report",
                color: Colors.red,
              ),
              onTap: () {} // TODO open dialog then send report
              ),
        ],
      ),
      appBar: MyAppBar(
        backArrow: true,
        text: "",
        onPressed: () {},
        icon: Icons.edit_outlined,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: height * 0.3 + 45,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: width - 20,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.24,
                          padding: const EdgeInsets.only(left: 25, right: 25),
                          child: Center(
                            child: Consumer(builder: (_, watch, __) {
                              final provider = watch(idiomInfoProvider);
                              return provider.isLoading
                                  ? PlaceholderContainer(
                                      width: width * 0.6,
                                      height: 24,
                                    )
                                  : Text(
                                      provider.idiom.text,
                                      style: Theme.of(context).textTheme.headline4,
                                    );
                            }),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          height: height * 0.06 - 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Consumer(builder: (_, watch, __) {
                                final provider = watch(idiomInfoProvider);
                                return provider.isLoading
                                    ? const PlaceholderContainer(
                                        width: 20,
                                        height: 18,
                                      )
                                    : Text(
                                        provider.idiom.upvoteCount.toString(),
                                        style: TextStyle(
                                            color: Colors.grey[400],
                                            fontWeight: FontWeight.w500,
                                            fontSize: 18),
                                      );
                              }),
                              Consumer(builder: (_, watch, __) {
                                final provider = watch(idiomInfoProvider);
                                return IconButton(
                                  onPressed: provider.isLoading ||
                                          !provider.idiom.isUserUpvoted ||
                                          provider.idiom.isUpvote
                                      ? provider.addUpvote
                                      : provider.addDevote,
                                  padding: EdgeInsets.zero,
                                  splashRadius: 20,
                                  icon: Icon(
                                    provider.isLoading ||
                                            !provider.idiom.isUserUpvoted ||
                                            provider.idiom.isUpvote
                                        ? Icons.arrow_drop_up_rounded
                                        : Icons.arrow_drop_down_rounded,
                                    size: 30,
                                    color: provider.isLoading || !provider.idiom.isUserUpvoted
                                        ? Colors.grey[400]
                                        : theme.accentColor,
                                  ),
                                );
                              }),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0, left: 12.0),
                                child: Consumer(builder: (_, watch, __) {
                                  final provider = watch(idiomInfoProvider);
                                  return provider.isLoading
                                      ? const PlaceholderContainer(width: 20, height: 18)
                                      : Text(
                                          provider.idiom.favoritesCount.toString(),
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500),
                                        );
                                }),
                              ),
                              Consumer(builder: (_, watch, __) {
                                final provider = watch(idiomInfoProvider);
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    splashRadius: 20,
                                    onPressed: provider.addFavorite,
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: provider.isLoading || !provider.idiom.isFavorite
                                          ? Colors.grey[400]
                                          : theme.accentColor,
                                      size: 30,
                                    ),
                                  ),
                                );
                              }),
                              Consumer(builder: (_, watch, __) {
                                final provider = watch(idiomInfoProvider);
                                return provider.isLoading
                                    ? const PlaceholderContainer(width: 80, height: 30)
                                    : FlagRow(code: provider.idiom.language.region);
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      padding: const EdgeInsets.only(right: 25),
                      child: Consumer(builder: (_, watch, __) {
                        final provider = watch(idiomInfoProvider);
                        return provider.isLoading
                            ? PlaceholderContainer(width: width * 0.3, height: 16)
                            : Text("Added by: ${provider.idiom.user.name}",
                                style: TextStyle(
                                    color: Colors.grey[400].withOpacity(0.7), fontSize: 16));
                      })),
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20, bottom: 10),
                child: Text(
                  "Languages: ",
                  style: TextStyle(
                      fontFamily: "Nexa",
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 40),
              child: TranslationSwitch(
                languages: [
                  "LV",
                  "RU",
                  "GB",
                  "LT",
                  "DK",
                  "US",
                  "FR",
                  "ET",
                  "FI",
                  "CH",
                  "SV",
                  "UA",
                  "PL",
                  "DE",
                ],
                selectedIndex: 1,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Meaning: ",
                  style: TextStyle(
                      fontFamily: "Nexa",
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 50, left: 25, right: 25),
            height: height * 0.2,
            child: Center(
              child: Consumer(builder: (_, watch, __) {
                final provider = watch(idiomInfoProvider);
                return provider.isLoading
                    ? PlaceholderContainer(
                        width: width * 0.5,
                        height: 24,
                      )
                    : Text(
                        provider.idiom.meaning,
                        style: Theme.of(context).textTheme.headline4,
                      );
              }),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Example: ",
                  style: TextStyle(
                      fontFamily: "Nexa",
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 50, left: 25, right: 25),
            height: height * 0.2,
            child: Center(
              child: Consumer(builder: (_, watch, __) {
                final provider = watch(idiomInfoProvider);
                return provider.isLoading
                    ? PlaceholderContainer(width: width * 0.5, height: 24)
                    : Text(
                        provider.idiom.usage,
                        style: Theme.of(context).textTheme.headline4,
                      );
              }),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Comments: ",
                  style: TextStyle(
                      fontFamily: "Nexa",
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              )),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
              child: MyTextField(
                text: "Comment",
                minLines: 4,
                controller: context.read(idiomInfoProvider).commentController,
                onChange: (value) => context.read(idiomInfoProvider).setComment(value),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(top: 20, right: 25),
                child: Consumer(builder: (_, watch, __) {
                  final provider = watch(idiomInfoProvider);
                  return MyButton(
                    text: "Comment",
                    width: width * 0.3,
                    height: 50,
                    isLoading: provider.commentSending,
                    onPress: () {
                      context.read(idiomInfoProvider).addComment();
                    },
                    disabled: provider.commentDisabled,
                  );
                }),
              )),
          Consumer(builder: (_, watch, __) {
            final provider = watch(idiomInfoProvider);
            return provider.idiom != null && provider.idiom.comments.isNotEmpty
                ? Container(
                    margin: EdgeInsets.only(top: height * 0.1, bottom: height * 0.1),
                    child: Column(
                        children: provider.idiom.comments
                            .map((x) => CommentTile(
                                  comment: x,
                                ))
                            .toList()),
                  )
                : const Center(
                    child: Text("No comments"),
                  );
          }),
        ],
      ),
    );
  }
}

class TranslationSwitch extends StatelessWidget {
  final List<String> languages;
  final int selectedIndex;
  const TranslationSwitch({Key key, this.languages, this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54.0 + languages.length * 50,
      child: Column(
        children: [
          SizedBox(
            width: 54.0 + languages.take(6).length * 55,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey[400]),
                SizedBox(
                  width: languages.take(6).length * 55.0,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: languages
                        .map((x) =>
                            FlagCircle(flag: x, selected: languages.indexOf(x) == selectedIndex))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlagCircle extends StatelessWidget {
  final bool selected;
  final String flag;
  const FlagCircle({Key key, this.selected, this.flag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(4),
      decoration: selected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1.5, color: Theme.of(context).accentColor))
          : const BoxDecoration(),
      child: ClipOval(
          child: CachedNetworkImage(
        imageUrl: "https://flagpedia.net/data/flags/w80/${flag.toLowerCase()}.jpg",
        width: 40,
        height: 40,
        fit: BoxFit.fill,
        placeholder: (context, url) => const PlaceholderContainer(
          width: 40,
          height: 40,
        ),
      )
          // child: Image.network("https://flagpedia.net/data/flags/w80/${flag.toLowerCase()}.jpg",
          //     width: 40, height: 40, fit: BoxFit.fill),
          ),
    );
  }
}

class SpeedDialLabel extends StatelessWidget {
  final Color color;
  final String text;
  const SpeedDialLabel({Key key, this.color, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(right: 10),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ));
  }
}

class UpvoteRow extends StatelessWidget {
  final int number;
  final double width;
  final double height;
  const UpvoteRow({Key key, this.number, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Row(
          children: [
            Text(
              number.toString(),
              style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Icon(
              Icons.arrow_drop_up_rounded,
              size: 30,
              color: Colors.grey[400],
            )
          ],
        ));
  }
}
