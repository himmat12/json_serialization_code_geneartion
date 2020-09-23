import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_serialization_code_gen/models/user_model.dart';

class UserService {
  String url;
  List data = [];
  var response;

  Iterable<User> userList = [];

  Future<List<User>> getUser({String id, String query}) async {
    url = 'https://jsonplaceholder.typicode.com/users';
    response = await http.get(url);
    data = json.decode(response.body);

    userList = data.map((e) => User.fromJson(e)).toList();

// filter - user data -> id
    if (id != null) {
      userList = userList
          .where((element) => element.id.toString().contains(id))
          .toList();
    }

// search - user data -> name
    if (query != null) {
      userList = userList
          .where((element) => element.name.toLowerCase().contains(query))
          .toList();
    }

    return userList;
  }
}
