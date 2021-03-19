import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/idiom_search_dialog.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/loading_indicator.dart';
import 'package:idiomclient/components/comment_tile.dart';
import 'package:idiomclient/components/my_text_field.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/models/idiom_link.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:idiomclient/providers/idiom_info_provider.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:idiomclient/providers/providers.dart';
import 'package:idiomclient/providers/idiom_link_provider.dart';

class IdiomInfoPage extends StatelessWidget {
  final ChangeNotifierProvider<IdiomInfoProvider> idiomInfoProvider;
  const IdiomInfoPage({Key key, this.idiomInfoProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    void _showDialog() {
      final idiomLinkProvider = ChangeNotifierProvider((ref) {
        final provider = ref.read(idiomInfoProvider);
        return IdiomLinkProvider(provider, provider.links,
            doSaveLinks: true, currentIdiomId: provider.idiom.idiomId);
      });
      showDialog(
              context: context,
              builder: (_) => Dialog(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: theme.scaffoldBackgroundColor,
                  child: IdiomSearchDialog(idiomLinkProvider)))
          .then((value) => context.read(idiomLinkProvider).clear());
    }

    void _showDeleteAlert() {
      final width = MediaQuery.of(context).size.width;
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: theme.scaffoldBackgroundColor,
                title: const Text("Are you sure?"),
                content: const Text(
                    "This action cant be undone, are you sure you want to remove this idiom?"),
                actions: [
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: Consumer(builder: (_, watch, __) {
                      final provider = watch(idiomInfoProvider);
                      return MyButton(
                        text: "Delete",
                        height: 50,
                        width: width * 0.25,
                        isLoading: provider.isDeleting,
                        onPress: () async {
                          await provider.deleteIdiom();
                          Navigator.of(context)..pop()..pop();
                        },
                      );
                    }),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    child: MyButton(
                      text: "Cancel",
                      height: 50,
                      width: width * 0.25,
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ));
    }

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
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Consumer(builder: (_, watch, __) {
          final provider = watch(idiomInfoProvider);
          return provider.isEditMode
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 35,
                    color: Colors.grey[400],
                  ),
                  splashRadius: 25,
                  onPressed: provider.cancelEditing,
                )
              : IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Colors.grey[400],
                  ),
                  splashRadius: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
        }),
        actions: [
          Consumer(builder: (_, watch, __) {
            final provider = watch(idiomInfoProvider);
            return provider.isEditMode
                ? Container()
                : Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: IconButton(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        splashRadius: 25,
                        icon: Icon(
                          Icons.delete_outline,
                          size: 35,
                          color: Colors.grey[400],
                        ),
                        onPressed: _showDeleteAlert),
                  );
          }),
          Consumer(builder: (_, watch, __) {
            final provider = watch(idiomInfoProvider);
            return provider.isEditMode
                ? Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      splashRadius: 25,
                      disabledColor: theme.dividerColor,
                      icon: Icon(
                        Icons.done,
                        size: 35,
                        color: provider.isUpdateAvailable ? Colors.grey[400] : theme.primaryColor,
                      ),
                      onPressed: provider.isUpdateAvailable
                          ? () {
                              provider.updateIdiom();
                            }
                          : null,
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: IconButton(
                      padding: const EdgeInsets.only(bottom: 2.0),
                      splashRadius: 25,
                      icon: Icon(
                        Icons.edit_outlined,
                        size: 35,
                        color: Colors.grey[400],
                      ),
                      onPressed: provider.switchToEditMode,
                    ),
                  );
          }),
        ],
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
                                  : provider.isEditMode
                                      ? SizedBox(
                                          height: height * 0.15,
                                          child: MyTextField(
                                            controller: provider.idiomController,
                                            onChange: (x) {
                                              provider.listenUpdateButtonAvailable();
                                            },
                                          ),
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
                                  splashRadius: 25,
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
                                    splashRadius: 25,
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 40),
              child: Consumer(builder: (_, watch, __) {
                final provider = watch(idiomInfoProvider);
                return provider.isLoading && (provider.links == null || provider.links.isEmpty)
                    ? const TranslationPlaceholder()
                    : TranslationSwitch(
                        links: provider.links,
                        selectedId: provider.idiomId,
                        onPress: _showDialog,
                        idiomInfoProvider: idiomInfoProvider,
                      );
              }),
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
                    : provider.isEditMode
                        ? SizedBox(
                            height: height * 0.15,
                            child: MyTextField(
                              controller: provider.meaningController,
                              onChange: (x) {
                                provider.listenUpdateButtonAvailable();
                              },
                            ),
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
                    : provider.isEditMode
                        ? SizedBox(
                            height: height * 0.15,
                            child: MyTextField(
                              controller: provider.usageController,
                              onChange: (x) {
                                provider.listenUpdateButtonAvailable();
                              },
                            ),
                          )
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
                                  onLike: () {
                                    provider.addLike(x);
                                  },
                                  onDislike: () {
                                    provider.addDisLike(x);
                                  },
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
  final List<IdiomLink> links;
  final int selectedId;
  final Function() onPress;
  final ChangeNotifierProvider<IdiomInfoProvider> idiomInfoProvider;
  const TranslationSwitch(
      {Key key, this.links, this.selectedId, this.onPress, this.idiomInfoProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey[400]),
                padding: EdgeInsets.zero,
                onPressed: () {
                  var backId = 0;
                  final index = links.indexOf(links.firstWhere((x) => x.idiomId == selectedId));
                  if (index == 0) {
                    backId = links.last.idiomId;
                  } else {
                    backId = links[index - 1].idiomId;
                  }
                  context.read(idiomInfoProvider).getOtherIdiomWithLinks(context
                      .read(idiomListProvider)
                      .list
                      .firstWhere((x) => x.idiomId == backId,
                          orElse: () => IdiomReply()..idiomId = backId));
                },
                splashRadius: 25,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 104,
                child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      ...links
                          .map((x) => FlagCircle(
                              flag: x.language.region,
                              selected: x.idiomId == selectedId,
                              onPressed: () {
                                context.read(idiomInfoProvider).getOtherIdiomWithLinks(context
                                    .read(idiomListProvider)
                                    .list
                                    .firstWhere((y) => y.idiomId == x.idiomId,
                                        orElse: () => IdiomReply()..idiomId = x.idiomId));
                              }))
                          .toList()
                    ]..add(
                        CircleButton(onPress: onPress),
                      )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.grey[400]),
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    var backId = 0;
                    final index = links.indexOf(links.firstWhere((x) => x.idiomId == selectedId));
                    if (index == links.length - 1) {
                      backId = links[0].idiomId;
                    } else {
                      backId = links[index + 1].idiomId;
                    }
                    context.read(idiomInfoProvider).getOtherIdiomWithLinks(context
                        .read(idiomListProvider)
                        .list
                        .firstWhere((x) => x.idiomId == backId,
                            orElse: () => IdiomReply()..idiomId = backId));
                  },
                  splashRadius: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Function() onPress;
  const CircleButton({Key key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(3.0),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: theme.buttonColor),
      child: IconButton(
        icon: Icon(Icons.add),
        color: theme.scaffoldBackgroundColor,
        onPressed: onPress,
        splashRadius: 30,
      ),
    );
  }
}

class TranslationPlaceholder extends StatelessWidget {
  const TranslationPlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0),
          child: Icon(Icons.arrow_back_ios, size: 25, color: Colors.grey[400]),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width - 90,
            child: const Center(
              child: PlaceholderContainer(width: 55, height: 55, borderRadius: 30),
            )),
        Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.grey[400]),
        ),
      ],
    );
  }
}

class FlagCircle extends StatelessWidget {
  final bool selected;
  final String flag;
  final Function() onPressed;
  const FlagCircle({Key key, this.selected, this.flag, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(selected ? 3.0 : 4.5),
      padding: const EdgeInsets.all(4),
      decoration: selected
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(width: 1.5, color: Theme.of(context).accentColor))
          : const BoxDecoration(),
      child: ClipOval(
        child: Material(
          child: InkWell(
            onTap: onPressed,
            child: CachedNetworkImage(
              imageUrl: "https://flagpedia.net/data/flags/w80/${flag.toLowerCase()}.jpg",
              width: 40,
              height: 40,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const PlaceholderContainer(
                width: 40,
                height: 40,
              ),
            ),
          ),
        ),
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
