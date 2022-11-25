import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/widgets/custom_bottom_appbar.widget.dart';
import 'package:librarian_mobile/widgets/library_fab.widget.dart';
import 'package:librarian_mobile/widgets/navigation_drawer.dart';

class LibraryScreen extends StatelessWidget {
  static String routeName = '/recipes';
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  const LibraryScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: const LibraryFab(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: CustomBottomAppBar(
        action: () => scaffoldKey.currentState!.openDrawer(),
      ),
      drawer: const NavigationDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const Text('Hello from LibraryScreen'),
              Text(Get.isDarkMode.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
