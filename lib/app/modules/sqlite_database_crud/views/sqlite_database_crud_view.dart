import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/app/data/db_helper/my_db_helper.dart';
import 'package:islamic_app/app/data/models/sqlite_db_model.dart';

import '../controllers/sqlite_database_crud_controller.dart';

class SqliteDatabaseCrudView extends GetView<SqliteDatabaseCrudController> {
  const SqliteDatabaseCrudView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqlite"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: controller.fNameEditingController,
                decoration: const InputDecoration(hintText: "First Name"),
              ),
              TextField(
                controller: controller.lNameEditingController,
                decoration: const InputDecoration(hintText: "Last Name"),
              ),
              TextField(
                controller: controller.emailEditingController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final customer = CustomerModel(
                          id: controller.random.nextInt(100),
                          firstName: controller.fNameEditingController.text,
                          lastName: controller.lNameEditingController.text,
                          email: controller.emailEditingController.text);

                      await DatabaseHelper.instance.addCustomer(customer);
                    },
                    child: const Text("Save"),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final customer = CustomerModel(
                          id: controller.customerId,
                          firstName: controller.fNameEditingController.text,
                          lastName: controller.lNameEditingController.text,
                          email: controller.emailEditingController.text);
                      await DatabaseHelper.instance.updateCustomer(customer);
                      controller.fNameEditingController.clear();
                    },
                    child: const Text("Update"),
                  ),
                ],
              ),
              SizedBox(
                  height: 400,
                  child: FutureBuilder(
                      future: DatabaseHelper.instance.getCustomer(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CustomerModel>> snapshot) {
                        if (!snapshot.hasData) {
                          return const Text("Loading......");
                        }
                        return ListView(
                          children: snapshot.data!.map((customer) {
                            return ListTile(
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        await DatabaseHelper.instance
                                            .deleteCustomer(customer.id);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                              title: Text("${customer.firstName}" +
                                  "${customer.lastName}"),
                              subtitle: Text("${customer.email}"),
                            );
                          }).toList(),
                        );
                      }))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
