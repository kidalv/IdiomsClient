import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:idiomclient/providers/add_idiom_provider.dart';
import 'package:idiomclient/providers/authorization_provider.dart';
import 'package:idiomclient/providers/favorites_provider.dart';
import 'package:idiomclient/providers/idiom_list_provider.dart';
import 'package:idiomclient/providers/profile_provider.dart';
import 'package:idiomclient/providers/settings_provider.dart';
import 'package:idiomclient/providers/registration_provider.dart';
import 'package:idiomclient/providers/login_provider.dart';

final settingsProvider = ChangeNotifierProvider<SettingsProvider>(
  (ref) => SettingsProvider(),
);

final registrationProvider =
    ChangeNotifierProvider<RegistrationProvider>((ref) => RegistrationProvider());

final loginProvider = ChangeNotifierProvider<LoginProvider>((ref) => LoginProvider());

final profileProvider = ChangeNotifierProvider<ProfileProvider>((ref) => ProfileProvider()..getProfile());

final addIdiomProvider = ChangeNotifierProvider<AddIdiomProvider>((ref) => AddIdiomProvider());

final idiomListProvider = ChangeNotifierProvider((ref) => IdiomListProvider());

final authorizationProvider = ChangeNotifierProvider((ref) => AuthorizationProvider());

final favoritesProvider = ChangeNotifierProvider((ref) => FavoritesProvider());