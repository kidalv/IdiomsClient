import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/providers/settings_provider.dart';
import 'package:idiomclient/providers/registration_provider.dart';

final settingsProvider = ChangeNotifierProvider<SettingsProvider>(
  (ref) => SettingsProvider(),
);

final registrationProvider = ChangeNotifierProvider<RegistrationProvider>(
  (ref) => RegistrationProvider()
);