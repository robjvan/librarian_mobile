import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewBookForm extends StatefulWidget {
  const NewBookForm({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<NewBookForm> createState() => _NewBookFormState();
}

class _NewBookFormState extends State<NewBookForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  List<Widget> _buildChildren() {
    var children = <Text>[];
    for (int i = 0; i < 100; i++) {
      children.add(Text('text ${i + 1}'));
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;

    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: sw,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Title:'),
                TextFormField(
                  maxLength: 32,
                  // decoration: InputDecoration(
                  //   hintText: 'userName',
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
