import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Function action;
  const CustomBottomAppBar({super.key, required this.action});

  @override
  Widget build(final BuildContext context) {
    return BottomAppBar(
      // shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Open Navigation Menu',
            onPressed: (() => action()),
          ),
          IconButton(
            icon: const Icon(Icons.nightlight_round),
            tooltip: 'Switch Theme',
            onPressed: () {
              Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
      ),
    );
  }
}
