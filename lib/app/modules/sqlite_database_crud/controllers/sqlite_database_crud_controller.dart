import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/data/db_helper/my_db_helper.dart';
import 'package:islamic_app/app/data/models/todo_model.dart';

class SqliteDatabaseCrudController extends GetxController {
  Random random = Random();
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  int? currentId;

  ///Rx class typically refers to an observable value from the GetX can automatically update their listeners whenever their value changes.
  ///------vvi---------initializes todosSnapshot as a reactive variable holding an AsyncSnapshot instance with no initial data. ----vvi

  Rx<AsyncSnapshot<List<TodoModels>>> todoSnapshot =
      Rx<AsyncSnapshot<List<TodoModels>>>(const AsyncSnapshot.nothing());

  ///save data
  Future saveTodo() async {
    try {
      final todo = TodoModels(
        id: random.nextInt(100),
        title: titleController.text,
        description: descriptionController.text,
      );
      await DatabaseHelper.instance.addTodos(todo);
      print("Todo saved successfully");
      titleController.clear();
      descriptionController.clear();
      fetchTodo();
    } catch (e) {
      print("Error saving todo: $e");
    }
  }

  ///update data
  ///
  void edit(TodoModels todo) {
    titleController.text = todo.title ?? '';
    descriptionController.text = todo.description ?? '';
    currentId = todo.id;
  }

  Future updateToDo() async {
    // Ensure an id is set
    if (currentId == null) return;
    final todo = TodoModels(
      id: currentId!,
      title: titleController.text,
      description: descriptionController.text,
    );
    await DatabaseHelper.instance.updateToDo(todo);
    titleController.clear();
    descriptionController.clear();
    currentId = null; // Reset currentId after update
    fetchTodo();
  }

  ///get data
  Future<void> fetchTodo() async {
    todoSnapshot.value = const AsyncSnapshot.waiting();

    /// before fetching it will stay waiting stage
    try {
      List<TodoModels> todos = await DatabaseHelper.instance.getTodos();
      todoSnapshot.value = todos.isNotEmpty
          ? AsyncSnapshot.withData(ConnectionState.done, todos)
          : const AsyncSnapshot.nothing();
    } catch (e) {
      todoSnapshot.value = AsyncSnapshot.withError(
          ConnectionState.done, "Error fetching todos: $e");
    }
  }

  ///delete data
  Future<void> deleteTodoById(int? id) async {
    try {
      await DatabaseHelper.instance.deleteTodo(id);
      print("Todo deleted successfully");
      // Update todoSnapshot after deletion
      fetchTodo();
    } catch (e) {
      print("Error deleting todo: $e");
    }
  }

  ///Complex Controllers: If your controller manages complex resources (like database connections, streams, or animations),
  /// using onInit and onClose ensures these resources are managed properly throughout their lifecycle.
  /// Memory Management: In scenarios where memory management is critical (e.g., mobile applications), onClose helps in releasing resources promptly to avoid memory leaks
  @override
  void onInit() {
    fetchTodo();

    titleController = TextEditingController();
    descriptionController = TextEditingController();
    super.onInit();
  }

  ///onReady is called after the widget is rendered on the screen. This method is called after the controller is fully initialized and the initial UI is built.
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
