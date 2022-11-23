import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserSettingsController extends GetxController {
  final GetStorage box = GetStorage();

  bool get useDarkMode => box.read('useDarkMode') ?? false;
  ThemeData get theme => useDarkMode ? ThemeData.dark() : ThemeData.light();

  void changeTheme(final bool val) {
    box.write('useDarkMode', val);
  }
}
