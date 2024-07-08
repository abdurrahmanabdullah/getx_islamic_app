// To parse this JSON data, do
//
//     final apiModel = apiModelFromJson(jsonString);

import 'dart:convert';

TodoModels apiModelFromJson(String str) =>
    TodoModels.fromJson(json.decode(str));

String apiModelToJson(TodoModels data) => json.encode(data.toJson());

class TodoModels {
  int? id;
  String? title;
  String? description;

  TodoModels({
    this.id,
    this.title,
    this.description,
  });

  factory TodoModels.fromJson(Map<String, dynamic> json) => TodoModels(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}

// class CustomerModel {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//
//   CustomerModel({this.id, this.firstName, this.lastName, this.email});
//
//   factory CustomerModel.fromMap(Map<String, dynamic> data) => CustomerModel(
//       id: data["id"],
//       firstName: data["first_name"],
//       lastName: data["last_name"],
//       email: data["email"]);
//
//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "first_name": firstName,
//         "last_name": lastName,
//         "email": email
//       };
// }
