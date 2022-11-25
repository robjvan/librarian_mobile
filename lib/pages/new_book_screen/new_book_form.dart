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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: SizedBox(
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
