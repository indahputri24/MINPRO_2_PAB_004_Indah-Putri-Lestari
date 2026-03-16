import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final box = GetStorage();
  var isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDark.value = box.read('darkmode') ?? false;
    if (isDark.value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }
  void toggleTheme() {
    isDark.value = !isDark.value;
    box.write('darkmode', isDark.value);
    if (isDark.value) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.light);
    }
  }
}