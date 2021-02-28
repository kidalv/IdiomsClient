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
                    Text(comment.user.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600])),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        getPastDays(DateTime.now().difference(comment.date.toDateTime()).inDays),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey[600]),
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

String getPastDays(int days) {
  if (days > 30) {
    return "${days/30} months ago";
  }
  if (days == 0) {
    return "today";
  }
  if (days == 1) {
    return "yesterday";
  }
  return "$days days ago";
}