import 'package:flutter/material.dart';
import 'package:idiomclient/protos/models.pb.dart';

class UserImage extends StatelessWidget {
  final UserReply user;
  final double size;
  const UserImage({Key key, this.user, this.size = 35}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: Color.fromRGBO(user.userId % 255, (user.userId * 15) % 255, (user.userId * 3 + 50) % 255, 1)
      ),
      child: Center(
        child: Text(user.name[0].toUpperCase() + (user.name.contains(' ') ? user.name[user.name.indexOf(' ') + 1].toUpperCase() : ''), style: TextStyle(fontSize: size / 2.5)),
      ),
    );
  }
}