import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final IconData icon;
  final void Function() onPressed;
  final bool disableIcon;
  final Widget iconButton;
  final bool backArrow;
  const MyAppBar(
      {Key key,
      this.text,
      this.icon,
      this.onPressed,
      this.disableIcon = false,
      this.iconButton,
      this.backArrow = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline1,
      ),
      leading: backArrow ? IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 35,
          color: Colors.grey[400],
        ),
        splashRadius: 25,
        onPressed: () {
          Navigator.pop(context);
        },
      ) : Container(),
      actions: [
        if (!disableIcon) Container(
                margin: const EdgeInsets.only(right: 12),
                child: iconButton ?? IconButton(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        splashRadius: 25,
                        icon: Icon(
                          icon,
                          size: 35,
                          color: Colors.grey[400],
                        ),
                        onPressed: onPressed),
              ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
