import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/providers/settings_provider.dart';

final settingsProvider = ChangeNotifierProvider<SettingsProvider>(
  (ref) => SettingsProvider(),
);