import 'package:flutter/material.dart';
import 'package:json_serialization_code_gen/models/user_model.dart';
import 'package:json_serialization_code_gen/services/user_service.dart';

class SearchUsers extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    UserService userService = UserService();

    return FutureBuilder(
      future: userService.getUser(query: query),
      builder: (context, snapshot) {
        List<User> userList = snapshot.data;

        return !snapshot.hasData
            ? LinearProgressIndicator()
            : ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(userList[index].name),
                  );
                },
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text(
        'search users according to their name\nin lowercase (eg : "ram" for Ram)',
        textAlign: TextAlign.center,
      ),
    );
  }
}
