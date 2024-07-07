import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/modules/notelist_sqlite/controllers/notelist_sqlite_controller.dart';

class NoteDetailsView extends GetView {
  // static var priorities = ['high', 'low'];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NotelistSqliteController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Editing'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            TextField(
              controller: titleController,
              onChanged: (val) {
                debugPrint('Title changed');
              },
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleController,
              onChanged: (val) {
                debugPrint('Description change ');
              },
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      controller.downloadFile().then((result) {
                        print(result); // To verify the function call
                      });
                    },
                    child: const Text(
                      'save',
                      textScaler: TextScaler.linear(1.5),
                    )),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Delete',
                      textScaler: TextScaler.linear(1.5),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
