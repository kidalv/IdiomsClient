import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class IdiomDetailsPage extends StatelessWidget {
  const IdiomDetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: SpeedDial(
        // both default to 16
        marginRight: 18,
        marginBottom: 20,
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 24.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        // If true user is forced to close dial manually
        // by tapping main button and overlay is not rendered.
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.favorite_border_outlined, size: 35),
            backgroundColor: Colors.pink,
            foregroundColor: Colors.white,
            labelWidget: SpeedDialLabel(
              text: "Favorite",
              color: Colors.pink,
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.arrow_drop_down_rounded, size: 40),
            backgroundColor: Colors.blue[400],
            foregroundColor: Colors.white,
            labelWidget: SpeedDialLabel(
              text: "Devote",
              color: Colors.blue[400],
            ),
          ),
          SpeedDialChild(
            child: Icon(
              Icons.arrow_drop_up_rounded,
              size: 40,
            ),
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            labelWidget: SpeedDialLabel(
              text: "Upvote",
              color: Colors.green,
            ),
          ),
          SpeedDialChild(
            child: Icon(Icons.error_outline, size: 35),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            labelWidget: SpeedDialLabel(
              text: "Report",
              color: Colors.red,
            ),
          ),
        ],
      ),
      appBar: MyAppBar(
        backArrow: true,
        text: "",
        onPressed: () {},
        icon: Icons.edit_outlined,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: height * 0.3 + 45,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: width - 20,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                        //borderRadius: BorderRadius.circular(10),
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0))
                        //border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
                        ),
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      children: [
                        Container(
                          height: height * 0.24,
                          child: Center(
                            child: Text(
                              "Saņemt pa purnu",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, bottom: 10),
                          height: height * 0.06 - 12,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "15",
                                style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              Icon(
                                Icons.arrow_drop_up_rounded,
                                size: 30,
                                color: Colors.grey[400],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0, left: 12.0),
                                child: Text(
                                  "9",
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Icon(
                                  Icons.favorite_border,
                                  color: Colors.grey[400],
                                  size: 30,
                                ),
                              ),
                              FlagRow(code: "LV"),
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
                      padding: EdgeInsets.only(right: 25),
                      child: Text("Added by: Vladislavs Kirvels",
                          style:
                              TextStyle(color: Colors.grey[400].withOpacity(0.7), fontSize: 16))),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              width: 105,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.grey[400]),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Flag(
                        "LV",
                        width: 15,
                        height: 15,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Flag(
                        "RU",
                        width: 20,
                        height: 20,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.grey[400]),
                ],
              ),
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
            height: height * 0.2,
            child: Center(
              child: Text(
                "But sists pa seju",
                style: Theme.of(context).textTheme.headline4,
              ),
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
            padding: EdgeInsets.all(10),
            height: height * 0.2,
            child: Center(
              child: Text(
                "Tu ko gribi sanemt pa purnu?",
                style: Theme.of(context).textTheme.headline4,
              ),
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
            child: Container(
              height: height * 0.2,
              width: width - 60,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1.0),
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.only(top: 20, right: 30),
                child: MyButton(
                  text: "Comment",
                  onPress: () {},
                ),
              )),
          Container(
            height: height * 0.2,
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1), width: 1.0))),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Shut up motherfucker",
                  style: theme.textTheme.headline4,
                )),
          )
        ],
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
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
    return Container(
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
