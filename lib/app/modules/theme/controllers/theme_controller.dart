import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkModel = false.obs;
  ThemeMode get theme => isDarkModel.value ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme() {
    isDarkModel.value = !isDarkModel.value;

    ///if light is already on then change dark vice versa
    Get.changeThemeMode(theme);

    final count = 0.obs;
    @override
    void onInit() {
      super.onInit();
    }

    @override
    void onReady() {
      super.onReady();
    }

    @override
    void onClose() {
      super.onClose();
    }

    void increment() => count.value++;
  }
}
