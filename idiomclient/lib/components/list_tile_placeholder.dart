import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/protos/idiom.pb.dart';
import 'package:idiomclient/screens/idiom_info_page.dart';

class ListTilePlaceholder extends StatelessWidget {
  const ListTilePlaceholder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Container(
      decoration:
          BoxDecoration(border: Border(bottom: BorderSide(color: theme.primaryColor))),
      margin: const EdgeInsets.only(left: 10, right: 10),
      height: height * 0.25,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_drop_up_rounded,
                size: 60,
                color: theme.buttonColor,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 50.0),
                child: PlaceholderContainer(width: 20, height: 18,))
            ],
          ),
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: height * 0.185,
                  width: width - 90,
                  child: Center(
                    child: PlaceholderContainer(width: width * 0.5, height: 24,)
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  width: width - 20 - 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.favorite_border,
                          size: 35,
                          color: theme.buttonColor,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 14.0),
                        child: PlaceholderContainer(width: 15, height: 18,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.translate_outlined,
                          size: 30,
                          color: theme.buttonColor,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 14.0),
                        child: PlaceholderContainer(width: 15, height: 18,),
                      ),
                      const PlaceholderContainer(width: 60, height: 30,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
