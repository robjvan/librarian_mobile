import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/api/books_api.dart';
import 'package:librarian_mobile/controllers/books.controller.dart';
import 'package:librarian_mobile/widgets/custom_bottom_appbar.widget.dart';
import 'package:librarian_mobile/widgets/library_fab.widget.dart';
import 'package:librarian_mobile/widgets/navigation_drawer.dart';

class LibraryScreen extends StatefulWidget {
  static String routeName = '/recipes';

  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BooksApi booksApi = BooksApi();
  final BooksController booksController = Get.find();

  @override
  void initState() {
    super.initState();
    booksApi.fetchBooks();
  }

  @override
  Widget build(final BuildContext context) {
    final double sh = MediaQuery.of(context).size.height;

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
          child: SizedBox(
            height: sh,
            child: Column(
              children: <Widget>[
                const Text('Hello from LibraryScreen'),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: booksController.userBooks.length,
                    itemBuilder: ((context, i) {
                      return ListTile(
                        leading: Text(booksController.userBooks[i].title),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
