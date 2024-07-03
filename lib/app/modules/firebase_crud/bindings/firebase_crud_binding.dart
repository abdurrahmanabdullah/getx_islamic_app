import 'package:get/get.dart';

import '../controllers/firebase_crud_controller.dart';

class FirebaseCrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseCrudController>(
      () => FirebaseCrudController(),
    );
  }
}
