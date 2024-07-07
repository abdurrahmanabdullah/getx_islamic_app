import 'package:get/get.dart';

class NotelistSqliteController extends GetxController {
  static var priorities = ['high', 'low'];

  final count = 0.obs;

  /// Asynchronous program --Future --Async --Await keyword
  ///
  downloadFile() {
    Future<String> res = Future.delayed(const Duration(seconds: 3), () {
      return 'Abdullah';
    });
    return res;
  }

  ///
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
