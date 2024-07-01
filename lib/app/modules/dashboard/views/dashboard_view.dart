import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/modules/theme/controllers/theme_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
        actions: [
          Obx(() => Switch(
                value: themeController.isDarkModel.value,
                onChanged: (value) {
                  themeController.toggleTheme();
                },
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'app_name'.tr,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              'app_title'.tr,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('en', 'US'));
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('bn', 'BD'));
              },
              child: const Text('Bangla'),
            ),
          ],
        ),
      ),
    );
  }
}
