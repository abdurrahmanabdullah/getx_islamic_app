import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/firebase_crud_controller.dart';

class FirebaseCrudView extends GetView<FirebaseCrudController> {
  const FirebaseCrudView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Note",
          )),
        ),
        body: FutureBuilder(
            future: controller.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(child: Text('something wrong'));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.network(snapshot.data.toString());
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 32),
          child: SingleChildScrollView(
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () => controller.toggleFormVisibility(),
                  child: const Icon(Icons.home),
                ),
                GetBuilder<FirebaseCrudController>(
                  builder: (controller) => controller.isFormVisible.value
                      ? controller.buildForm(context)
                      : Container(),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () => controller.openNoteBox(context),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
