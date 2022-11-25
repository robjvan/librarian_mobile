import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarian_mobile/api/books_api.dart';
import 'package:librarian_mobile/models/book.model.dart';
import 'package:librarian_mobile/pages/library_screen/library_screen.dart';

class NewBookForm extends StatefulWidget {
  const NewBookForm({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  State<NewBookForm> createState() => _NewBookFormState();
}

class _NewBookFormState extends State<NewBookForm> {
  final BooksApi booksApi = BooksApi();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pageCountController = TextEditingController();
  final TextEditingController publishYearController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController isbn10Controller = TextEditingController();
  final TextEditingController isbn13Controller = TextEditingController();

  late bool isMature = false;
  late bool haveRead = false;
  late bool inShoppingList = false;
  late bool inFavesList = false;
  late bool inWishlist = false;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    pageCountController.dispose();
    publishYearController.dispose();
    publisherController.dispose();
    isbn10Controller.dispose();
    isbn13Controller.dispose();
    super.dispose();
  }

  void submitFunction() {
    // Grab values from various fields, send off to API for processing
    Book newBook = Book(
      title: titleController.text,
      description: descriptionController.text,
      pageCount: int.parse(pageCountController.text),
      publishYear: int.parse(publishYearController.text),
      author: authorController.text,
      haveRead: haveRead,
      inFavesList: inFavesList,
      inShoppingList: inShoppingList,
      inWishlist: inWishlist,
      isMature: isMature,
      isbn10: int.parse(isbn10Controller.text),
      isbn13: int.parse(isbn13Controller.text),
      publisher: publisherController.text,
    );
    booksApi.addNewBook(newBook);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPhotoPicker(),
          _buildTitleField(),
          _buildAuthorField(),
          _buildDescriptionField(),
          _buildPageCountField(),
          _buildPublisherField(),
          _buildPublishYearField(),
          _buildCheckboxFields(),
          _buildIsbnFields(),
          _buildSubmitButton(),
          _buildCancelButton(),
        ],
      ),
    );
  }

  Widget _buildPhotoPicker() {
    // TODO(Rob): Add ability to add an image from camera/gallery
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      height: 200,
      width: 130,
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
      ),
      // TODO(Rob): Add placeholder image
    );
  }

  Widget _buildTitleField() {
    return _genericInputField(
      label: 'Title:',
      hintText: '"Jurassic Park"',
      controller: titleController,
    );
  }

  Widget _buildAuthorField() {
    return _genericInputField(
      label: 'Author:',
      hintText: '"Michael Crichton"',
      controller: authorController,
    );
  }

  Widget _buildDescriptionField() {
    return _genericInputField(
      label: 'Description:',
      hintText: '"A book about dinosaurs"',
      controller: descriptionController,
    );
  }

  Widget _buildPageCountField() {
    return _genericInputField(
      label: 'Page Count:',
      hintText: '"328"',
      controller: pageCountController,
    );
  }

  Widget _buildPublishYearField() {
    return _genericInputField(
      label: 'Publish Year:',
      hintText: '"1994"',
      controller: publishYearController,
    );
  }

  Widget _buildPublisherField() {
    return _genericInputField(
      label: 'Publisher:',
      hintText: '"Amblin"',
      controller: publisherController,
    );
  }

  Widget _buildIsbnFields() {
    return Column(
      children: [
        _genericInputField(
          label: 'ISBN10:',
          hintText: '"1234567890"',
          controller: isbn10Controller,
        ),
        _genericInputField(
          label: 'ISBN13:',
          hintText: '"1234567890123"',
          controller: isbn13Controller,
        ),
      ],
    );
  }

  Widget _buildCheckboxFields() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              _genericCheckboxField('haveread', label: 'Have read before?'),
              _genericCheckboxField('faves',
                  label: 'Add to Faves?', checked: inFavesList),
            ],
          ),
          Row(
            children: [
              _genericCheckboxField('wishlist', label: 'Add to Wishlist?'),
              _genericCheckboxField('shoppinglist',
                  label: 'Add to Shopping list?'),
            ],
          ),
          Row(
            children: [
              _genericCheckboxField('ismature',
                  label: 'Contains mature content?'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _genericInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: Get.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150,
              child: Text(label),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: (Get.width) * 0.6,
              child: TextFormField(
                onChanged: (newValue) {
                  print('newValue = $newValue');
                  print('controller.text = ${controller.text}');
                },
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: hintText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genericCheckboxField(
    String purpose, {
    required String label,
    bool checked = false,
  }) {
    return SizedBox(
      width: Get.width / 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 175,
            child: Text(label),
          ),
          const SizedBox(width: 8),
          SizedBox(
              child: Checkbox(
            value: checked,
            onChanged: (val) {
              setState(() {
                switch (purpose) {
                  case 'faves':
                    inFavesList = !inFavesList;
                    break;
                  case 'haveread':
                    haveRead = !haveRead;
                    break;
                  case 'wishlist':
                    inWishlist = !inWishlist;
                    break;
                  case 'shoppinglist':
                    inShoppingList = !inShoppingList;
                    break;
                  case 'ismature':
                    isMature = !isMature;
                    break;
                }
              });
            },
          )),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 60),
          maximumSize: const Size(200, 60),
        ),
        onPressed: submitFunction,
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size(200, 40),
          maximumSize: const Size(200, 40),
        ),
        onPressed: () {
          Get.offAll(const LibraryScreen());
        },
        child: const Text('Cancel'),
      ),
    );
  }
}
