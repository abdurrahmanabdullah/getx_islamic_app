import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:islamic_app/app/data/models/user_api_models.dart';

class ApiService {
  Future<List<ApiModel>> fetchApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      final parse = json.decode(response.body);
      return parse.map<ApiModel>((json) => ApiModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to Load album');
    }
  }
}
