import 'package:get/get.dart';

import '../controllers/notelist_sqlite_controller.dart';

class NotelistSqliteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotelistSqliteController>(
      () => NotelistSqliteController(),
    );
  }
}
