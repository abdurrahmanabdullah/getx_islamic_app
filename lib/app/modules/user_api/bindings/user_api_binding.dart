import 'package:get/get.dart';

import '../controllers/user_api_controller.dart';

class UserApiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiController>(
      () => ApiController(),
    );
  }
}
