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
            child: Text("Note"),
          ),
        ),
        body: FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong.'));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                return Image.network(snapshot.data.toString());
              } else {
                return const Center(child: Text('Image not found.'));
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 38.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () => controller.toggleFormVisibility(),
                  child: const Icon(Icons.home),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () => controller.openNoteBox(context),
                  child: const Icon(Icons.add),
                ),
              ),
              Obx(() {
                if (controller.isFormVisible.value) {
                  return Positioned(
                    left: 32,
                    right: 32,
                    bottom: 80,
                    child: Material(
                      elevation: 8.0,

                      ///elevation: 8.0:means the widget will have a relatively high shadow, giving it a more pronounced 3D effect
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: controller.buildForm(context),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
