import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:librarian_mobile/pages/dashboard_screen/dashboard_screen.dart';
import 'package:librarian_mobile/pages/library_screen/library_screen.dart';
import 'package:librarian_mobile/pages/login_screen/login_screen.dart';
import 'package:librarian_mobile/pages/register_screen/register_screen.dart';
import 'package:librarian_mobile/pages/settings_screen/settings_screen.dart';
import 'package:librarian_mobile/pages/shopping_list_screen/shopping_list_screen.dart';

Future<bool> isRooted() async {
  final bool isRooted = await FlutterJailbreakDetection.jailbroken;
  // bool developerMode = await FlutterJailbreakDetection.developerMode;
  const bool isDebugging = !kReleaseMode;

  if (isDebugging) {
    debugPrint('Device is rooted?  $isRooted');
    if (isRooted) debugPrint('Ignoring root: developer mode detected');
    return false;
  }

  return isRooted;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const LibrarianApp());
}

class LibrarianApp extends StatelessWidget {
  const LibrarianApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'US'),
      title: 'app-title'.tr,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),    
      debugShowCheckedModeBanner: false,
      // initialRoute: LoadingScreen.routeName, //TODO: Add load screen
      initialRoute: LoginScreen.routeName,
      getPages: <GetPage<dynamic>>[
        GetPage<dynamic>(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage<dynamic>(
          name: DashboardScreen.routeName,
          page: () => const DashboardScreen(),
        ),
        GetPage<dynamic>(
          name: LibraryScreen.routeName,
          page: () => const LibraryScreen(),
        ),
        GetPage<dynamic>(
          name: SettingsScreen.routeName,
          page: () => const SettingsScreen(),
        ),
        GetPage<dynamic>(
          name: ShoppingListScreen.routeName,
          page: () => const ShoppingListScreen(),
        ),
        GetPage<dynamic>(
          name: RegisterScreen.routeName,
          page: () => const RegisterScreen(),
        ),
      ],
    );
  }
}
