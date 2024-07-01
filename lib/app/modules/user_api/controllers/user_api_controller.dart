// import 'package:get/get.dart';
//
// class UserApiController extends GetxController {
//   //TODO: Implement UserApiController
//
//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   void increment() => count.value++;
// }

import 'package:get/get.dart';
import 'package:islamic_app/app/data/models/user_api_models.dart';
import 'package:islamic_app/app/data/services/user_api_services.dart';

class ApiController extends GetxController {
  var isLoading = true.obs;
  var apiList = <ApiModel>[].obs;

  /// if any data want to observable for dynamic  purpose,  controller can modify at any time for obx
  @override
  void onInit() {
    getApi();

    super.onInit();
  }

  void getApi() async {
    var data = await ApiService().fetchApi();
    if (data.isNotEmpty) {
      apiList.clear();
      isLoading(false);
      apiList.addAll(data);
    }
  }
}
