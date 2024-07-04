import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SqliteDatabaseCrudController extends GetxController {
  late TextEditingController fNameEditingController;
  late TextEditingController lNameEditingController;
  late TextEditingController emailEditingController;
  Random random = Random();
  int customerId = 0;
  final count = 0.obs;
  @override
  void onInit() {
    fNameEditingController = TextEditingController();
    lNameEditingController = TextEditingController();
    emailEditingController = TextEditingController();
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
