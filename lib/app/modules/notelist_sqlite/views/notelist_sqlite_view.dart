import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/routes/app_pages.dart';

import '../controllers/notelist_sqlite_controller.dart';

class NotelistSqliteView extends GetView<NotelistSqliteController> {
  const NotelistSqliteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
        centerTitle: true,
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.NOTE_DETAILS);
        },
        tooltip: 'Add Note',
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: const Text('Dummy Title'),
              subtitle: const Text('Dummy Data'),
              trailing: const Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                print("press it ");
              },
            ),
          );
        });
  }
}
