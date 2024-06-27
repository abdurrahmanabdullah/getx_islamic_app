import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_api_controller.dart';

class UserApiView extends GetView<ApiController> {
  final apiCon = Get.put(ApiController());
  UserApiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('api screen'),
      ),
      body: Obx(() => apiCon.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: apiCon.apiList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                    title: Text(apiCon.apiList[index].title.toString()));
              },
            )),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:islamic_app/app/data/controllers/api_controller.dart';
//
// class ApiScreen extends StatelessWidget {
//   final apiCon = Get.put(ApiController());
//   ApiScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('api screen'),
//       ),
//       body: Obx(() => apiCon.isLoading.value
//           ? const Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: apiCon.apiList.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//               title: Text(apiCon.apiList[index].title.toString()));
//         },
//       )),
//     );
//   }
// }
