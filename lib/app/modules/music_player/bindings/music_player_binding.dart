import 'package:get/get.dart';

import '../controllers/music_controller.dart';

class MusicPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
