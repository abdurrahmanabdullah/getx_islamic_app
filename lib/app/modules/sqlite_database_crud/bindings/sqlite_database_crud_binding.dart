import 'package:get/get.dart';

import '../controllers/sqlite_database_crud_controller.dart';

class SqliteDatabaseCrudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SqliteDatabaseCrudController>(
      () => SqliteDatabaseCrudController(),
    );
  }
}
