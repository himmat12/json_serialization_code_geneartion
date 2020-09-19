import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_serialization_code_gen/models/user_model.dart';

class UserService {
  String url;
  List data = [];
  var response;

  List<User> userList = [];

  Future<List<User>> getUser() async {
    url = 'https://jsonplaceholder.typicode.com/users';
    response = await http.get(url);
    data = json.decode(response.body);

    userList = data.map((e) => User.fromJson(e)).toList();

    return userList;
  }
}
