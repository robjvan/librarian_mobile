import 'package:flutter/material.dart';
import 'package:librarian_mobile/pages/new_book_screen/new_book_form.dart';

class NewBookScreen extends StatelessWidget {
  const NewBookScreen({super.key});
  static const String routeName = '/newbook';

  @override
  Widget build(final BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: SizedBox(
        width: sw,
        height: sh,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildHeaderWidget(context),
              const SizedBox(height: 32),
              const NewBookForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderWidget(final BuildContext context) => const Text(
        'Add new book',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      );
}
