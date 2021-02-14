import 'package:flutter/material.dart';
import 'package:idiomclient/components/flag_row.dart';
import 'package:idiomclient/components/my_app_bar.dart';
import 'package:idiomclient/components/my_hint.dart';
import 'package:idiomclient/components/my_button.dart';
import 'package:idiomclient/providers/settings_provider.dart';
import 'package:idiomclient/services/shared_prefs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return ChangeNotifierProvider<SettingsProvider>(
      create: (_) => SettingsProvider(),
      builder: (context, _) => Scaffold(
        appBar: const MyAppBar(
          text: "Settings",
          disableIcon: true,
          backArrow: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
                child: Text("My Languages", style: theme.textTheme.headline5),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
                child: Text("System Language", style: theme.textTheme.headline5),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
                child: Row(
                  children: [
                    Text("Display Flags", style: theme.textTheme.headline5),
                    MyHint(
                      text: "Show flags to represent languages",
                    ),
                    Switch(
                        value: context.watch<SettingsProvider>().showFlags,
                        activeTrackColor: Colors.grey[700],
                        inactiveTrackColor: Colors.grey[700],
                        activeColor: theme.accentColor,
                        onChanged: (x) {Provider.of<SettingsProvider>(context, listen: false).setShowFlags(x);})
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, left: 20.0, top: 20.0),
                child: Row(
                  children: [
                    Text("Hide Tooltips", style: theme.textTheme.headline5),
                    Switch(
                        value: context.watch<SettingsProvider>().hideTooltips,
                        activeTrackColor: Colors.grey[700],
                        inactiveTrackColor: Colors.grey[700],
                        activeColor: theme.accentColor,
                        onChanged: (x) {Provider.of<SettingsProvider>(context, listen: false).setHideTooltips(x);})
                  ],
                ),
              ),
              MyButton(
                text: "Change Password",
                onPress: () {},
              ),
              MyButton(
                text: "Logout",
                onPress: () {},
              ),
              SizedBox(
                height: 5000,
                child: Column(
                  children: SharedPrefs().languages.map((x) => FlagRow(code: x.region)).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
