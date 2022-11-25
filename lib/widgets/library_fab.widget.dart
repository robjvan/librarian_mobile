import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/config/config.dart';
import 'package:librarian_mobile/pages/new_book_screen/new_book_screen.dart';

class LibraryFab extends StatefulWidget {
  const LibraryFab({super.key});

  @override
  State<LibraryFab> createState() => _LibraryFabState();
}

class _LibraryFabState extends State<LibraryFab> {
  bool isMobile = false;

  @override
  void initState() {
    super.initState();
    checkPlatform();
  }

  void checkPlatform() async {
    final String platform = await Config().getPlatform();
    if (platform == 'ios' || platform == 'android') {
      isMobile = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      elevation: 8.0,
      animationCurve: Curves.bounceInOut,
      childMargin: const EdgeInsets.only(left: 8),
      children: <SpeedDialChild>[
        isMobile
            ? SpeedDialChild(
                child: const Icon(Icons.camera_alt),
                label: 'Scan ISBN to add book',
                onTap: () {
                  // TODO(Rob): Add logic to search for ISBN after scanning with camera
                })
            : SpeedDialChild(),
        SpeedDialChild(
            child: const Icon(Icons.manage_search),
            label: 'Search by details to add book',
            onTap: () {
              // TODO(Rob): Add logic to search for a book using title, author, etc.
            }),
        SpeedDialChild(
            child: const Icon(Icons.list_alt),
            label: 'Manually enter details to add a book',
            onTap: () {
              Get.off(() => const NewBookScreen());
            }),
      ],
    );
  }
}
