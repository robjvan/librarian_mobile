import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/pages/dashboard_screen/dashboard_screen.dart';
import 'package:librarian_mobile/pages/library_screen/library_screen.dart';
import 'package:librarian_mobile/pages/login_screen/login_screen.dart';
import 'package:librarian_mobile/pages/settings_screen/settings_screen.dart';
import 'package:librarian_mobile/pages/shopping_list_screen/shopping_list_screen.dart';

class NavigationDrawer extends Drawer {
  const NavigationDrawer({super.key});

  @override
  Widget build(final BuildContext context) => Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                _buildNavigationRow(
                  navRoute: DashboardScreen.routeName,
                  iconData: Icons.menu,
                  label: 'Dashboard',
                ),
                _buildNavigationRow(
                  navRoute: LibraryScreen.routeName,
                  iconData: Icons.cookie_outlined,
                  label: 'My Library',
                ),
                _buildNavigationRow(
                  navRoute: ShoppingListScreen.routeName,
                  iconData: Icons.shopping_bag_outlined,
                  label: 'Shopping List',
                ),
                Expanded(child: Container()),
                _buildNavigationRow(
                  navRoute: SettingsScreen.routeName,
                  iconData: Icons.settings_outlined,
                  label: 'Settings',
                ),
                _buildLogoutButton(context),
              ],
            ),
          ),
        ),
      );

  Widget _buildLogoutButton(final BuildContext context) => TextButton(
        onPressed: () => Get.offAll(LoginScreen.new),
        child: const Text('Logout'),
      );

  Widget _buildNavigationRow({
    required final String navRoute,
    required final IconData iconData,
    required final String label,
  }) =>
      TextButton(
        // onPressed: () => Navigator.pushReplacementNamed(
        //   navRoute,
        // ),
        onPressed: () => Get.offAllNamed(navRoute),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: <Widget>[
              Icon(iconData),
              const SizedBox(width: 16),
              Text(label),
              const Spacer(),
            ],
          ),
        ),
      );
}
