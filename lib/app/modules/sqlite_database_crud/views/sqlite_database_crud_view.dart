import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/sqlite_database_crud_controller.dart';

class SqliteDatabaseCrudView extends GetView<SqliteDatabaseCrudController> {
  const SqliteDatabaseCrudView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sqlite CRUD"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(hintText: "Title"),
              ),
              TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(hintText: "Description"),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.saveTodo();
                    },
                    child: const Text(
                      "Save",
                      textScaler: TextScaler.linear(1.5),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.updateToDo();
                      // controller.titleController.text =
                      //     todo.title ?? '';
                      // controller.descriptionController.text =
                      //     todo.description ?? '';

                      // final todo = TodoModels(
                      //   id: controller.random.nextInt(100),
                      //   title: controller.titleController.text,
                      //   description: controller.descriptionController.text,
                      // );
                    },
                    child: const Text(
                      "Update",
                      textScaler: TextScaler.linear(1.5),
                    ),
                  ),
                ],
              ),
              // FutureBuilder(
              //   future: DatabaseHelper.instance.getTodos(),
              //   builder: (BuildContext context, AsyncSnapshot snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return const Center(child: CircularProgressIndicator());
              //     } else if (snapshot.hasError) {
              //       return const Center(child: Text('Error occurred'));
              //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              //       return const Center(child: Text('No data found'));
              //     } else {
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: snapshot.data!.length,
              //         itemBuilder: (context, index) {
              //           final todo = snapshot.data![index];
              //           return ListTile(
              //             title: Text(todo.title!),
              //             subtitle: Text(todo.description ?? ''),
              //           );
              //         },
              //       );
              //     }
              //   },
              // )

              Obx(
                () {
                  if (controller.todoSnapshot.value.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.todoSnapshot.value.hasError) {
                    return Center(
                        child: Text(
                            'Error occurred: ${controller.todoSnapshot.value.error}'));
                  } else if (!controller.todoSnapshot.value.hasData ||
                      controller.todoSnapshot.value.data!.isEmpty) {
                    return const Center(child: Text('No data found'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.todoSnapshot.value.data!.length,
                      itemBuilder: (context, index) {
                        final todo = controller.todoSnapshot.value.data![index];
                        return ListTile(
                          leading: IconButton(
                              onPressed: () {
                                controller.edit(todo);
                              },
                              icon: const Icon(Icons.edit)),
                          title: Text(todo.title!),
                          subtitle: Text(todo.description ?? ''),
                          trailing: IconButton(
                              onPressed: () async {
                                controller.deleteTodoById(todo.id);
                              },
                              icon: const Icon(Icons.delete)),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
