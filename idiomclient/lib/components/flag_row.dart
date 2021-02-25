import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:idiomclient/components/placeholder_container.dart';
import 'package:idiomclient/services/shared_prefs.dart';

class FlagRow extends StatelessWidget {
  final String code;
  final double length;
  final bool flagOnly;
  const FlagRow({Key key, this.code, this.length = 40, this.flagOnly = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        if (!flagOnly)
          SizedBox(
            width: 30,
            child: Text(
              code,
              style: TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
        Container(
          margin: const EdgeInsets.only(left: 3),
          width: length,
          height: length * 0.75,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: (code != "EO" && code != "LA" && code != "GL") && SharedPrefs().showFlags
                  ? CachedNetworkImage(
                      imageUrl: "https://flagpedia.net/data/flags/w80/${code.toLowerCase()}.jpg",
                      placeholder: (context, url) =>
                          PlaceholderContainer(width: length, height: length * 0.75),
                      width: length,
                      height: length * 0.75,
                      fit: BoxFit.fill)
                  : Container(
                      color: theme.buttonColor,
                      child: Center(
                          child: Text(
                        code,
                        style: theme.textTheme.button,
                      ))),
            ),
          ),
        ),
      ],
    );
  }
}
