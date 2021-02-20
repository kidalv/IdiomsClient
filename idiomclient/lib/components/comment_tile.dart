import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';
import 'package:intl/intl.dart';

class CommentTile extends StatelessWidget {
  final CommentReply comment;
  const CommentTile({Key key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.25;
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final dateFormat = DateFormat.yMd();
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: theme.dividerColor))),
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.only(left: 15, right: 25),
      height: height,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
                height: height * 0.20,
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.6 - 30,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(comment.user.name,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600])),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.4 - 30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          dateFormat.format(comment.date.toDateTime()),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[600]),
                        ),
                      ),
                    )
                  ],
                )),
          ),
          SizedBox(
              height: height * 0.80 - 1,
              child: Center(child: Text(comment.text, style: theme.textTheme.headline3)))
        ],
      ),
    );
  }
}
