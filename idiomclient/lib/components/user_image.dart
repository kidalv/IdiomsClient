import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';

class UserImage extends StatelessWidget {
  final UserReply user;
  const UserImage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(user.userId % 255, (user.userId * 15) % 255, (user.userId * 3 + 50) % 255, 1)
      ),
      child: Center(
        child: Text(user.name[0].toUpperCase() + (user.name.contains(' ') ? user.name[user.name.indexOf(' ') + 1].toUpperCase() : '')),
      ),
    );
  }
}