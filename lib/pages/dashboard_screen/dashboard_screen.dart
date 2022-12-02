import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:librarian_mobile/api/books_api.dart';
import 'package:librarian_mobile/controllers/books.controller.dart';
import 'package:librarian_mobile/widgets/custom_bottom_appbar.widget.dart';
import 'package:librarian_mobile/widgets/navigation_drawer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static String routeName = '/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final BooksController booksController = Get.find();
  final BooksApi booksApi = BooksApi();

  @override
  void initState() {
    super.initState();
    booksApi.fetchBooks();
  }


  @override
  Scaffold build(final BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const NavigationDrawer(),
      bottomNavigationBar: CustomBottomAppBar(
        action: () => scaffoldKey.currentState!.openDrawer(),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('Hello from DashboardScreen'),
              // const Text(
              //   'The dashboard will have quick access to favorite recipes, shopping list, and fun insights about the user\'s collection, like how many recipes they have, how many they\'ve cooked, "It would take 35kg of butter to make all the cookies in your collection!", etc.',
              // ),
              const SizedBox(height: 32),
              Obx(
                () => Text(
                    'Congrats, you have ${booksController.userBooks.length} book(s) in your collection!'),
              ),
              // const SizedBox(height: 32),
              // Text('AuthToken = ${box.read('authToken')}'),
            ],
          ),
        ),
      ),
    );
  }
}
