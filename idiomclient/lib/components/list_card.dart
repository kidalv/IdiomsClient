import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'frosted_glass.dart';

class ListCard extends StatelessWidget {
  const ListCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.width * 0.35,
      child: FrostedGlass(
          borderRadius: BorderRadius.circular(12.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        GlowIcon(
                          MdiIcons.arrowUpBold,
                          glowColor: Colors.greenAccent.withOpacity(0.5),
                          size: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.green,
                        ),
                        Text("15",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 18))
                      ],
                    ),
                    Column(
                      children: [
                        GlowIcon(
                          MdiIcons.star,
                          glowColor: Colors.orangeAccent.withOpacity(0.5),
                          size: MediaQuery.of(context).size.width * 0.1,
                          color: Colors.orange,
                        ),
                        Text("12",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 18))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text("Saņemt pa purnu",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 24))),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.06,
                        child: Text(
                          "LV",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[400].withOpacity(0.3),
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(color: Colors.white.withOpacity(0.4), width: 1.0),
                        ),
                        child: Container(
                          width: 40,
                          height: 30,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Flag(
                                'LV',
                                width: 40,
                                height: 30,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
