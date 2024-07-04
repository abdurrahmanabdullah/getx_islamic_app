import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseCrudController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController mobile = TextEditingController();
  var isFormVisible = false.obs;
  String? downloadURL;
  void toggleFormVisibility() {
    isFormVisible.value = !isFormVisible.value;
  }

  void openNoteBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textEditingController,
        ),
        actions: [
          ElevatedButton(
              // onPressed: () => saveNoteToFireStore(context),
              onPressed: () => saveNoteToFireStore(context),
              child: const Text('Add'))
        ],
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40, left: 40),
      child: Column(
        children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: email,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: mobile,
            decoration: const InputDecoration(labelText: 'Mobile'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              saveFormToFireStore(context);
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }

  void home(BuildContext context) {
    Column(
      children: [
        TextField(
          controller: name,
        ),
      ],
    );
    TextField(
      controller: email,
    );
    TextField(
      controller: mobile,
    );
  }

  Future<void> downloadURLExample() async {
    try {
      downloadURL = await FirebaseStorage.instance
          .ref()
          .child("Qbanner.png")
          .getDownloadURL();
      print('Download URL: $downloadURL');
    } catch (e) {
      print('Error fetching download URL: $e'); // Error handling
      downloadURL = null;
    }
  }

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      print(e);
    }
  }

  void saveFormToFireStore(BuildContext context) async {
    final String nameText = name.text;
    final String emailText = email.text;
    final String mobileText = mobile.text;

    if (nameText.isNotEmpty && emailText.isNotEmpty && mobileText.isNotEmpty) {
      await FirebaseFirestore.instance.collection('notes').add({
        'name': nameText,
        'email': emailText,
        'mobile': mobileText,
        'timestamp': FieldValue.serverTimestamp(),
      });

      // Clear the text fields after saving
      name.clear();
      email.clear();
      mobile.clear();

      Get.back(); // Close the dialog
    }
  }

  void saveNoteToFireStore(context) async {
    final note = textEditingController.text;
    if (note.isNotEmpty) {
      await FirebaseFirestore.instance.collection('notes').add({
        'note': note,
        'timestamp': FieldValue.serverTimestamp(),
      });
      textEditingController.clear();
      Get.back(); // Close the dialog
    }
  }

  final count = 0.obs;
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
