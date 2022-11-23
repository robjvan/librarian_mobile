import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserSettingsController extends GetxController {
  // final GetStorage box = GetStorage();
  // RxBool useDarkMode = false.obs;

  // ThemeData get theme =>
  // useDarkMode.value ? ThemeData.dark() : ThemeData.light();

  void changeTheme(final bool val) {
    // box.write('useDarkMode', val);
  }

  void toggleTheme() {
    Get.isDarkMode ? ThemeData.light() : ThemeData.dark();
    // box.write('useDarkMode', Get.isDarkMode);
  }
}
