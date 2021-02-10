import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/providers/idiom_info_provider.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/screens/idiom_info_page.dart';

class IdiomListTile extends StatelessWidget {
  final IdiomReply idiom;
  const IdiomListTile({Key key, this.idiom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IdiomInfoPage(provider: IdiomInfoProvider(idiom.idiomId),)),
        );
      },
      child: Container(
        decoration:
            BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1)))),
        margin: EdgeInsets.only(left: 10, right: 10),
        height: height * 0.25,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_drop_up_rounded,
                  size: 60,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: Text(idiom.upvoteCount.toString(),
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
                    width: width - 90,
                    child: Center(
                      child: Text(
                        idiom.text,
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
                            Icons.favorite_border,
                            size: 35,
                            color: idiom.isFavorite ? theme.accentColor : Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(idiom.favoritesCount.toString(),
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
                        FlagRow(
                          code: idiom.language.locale,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
