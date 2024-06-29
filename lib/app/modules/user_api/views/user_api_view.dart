import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_api_controller.dart';

class UserApiView extends GetView<ApiController> {
  const UserApiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('api screen'),
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: controller.apiList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(controller.apiList[index].title.toString()));
              },
            )),
    );
  }
}
