import 'package:flutter/material.dart';
import 'package:json_serialization_code_gen/models/user_model.dart';
import 'package:json_serialization_code_gen/services/user_service.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: FutureBuilder(
          future: userService.getUser(),
          builder: (context, snapshot) {
            List<User> userList = snapshot.data;

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error),
              );
            }

            return snapshot.hasData
                ? ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(userList[index].name),
                          subtitle: Text(userList[index].address.zipcode),
                          trailing: Column(
                            children: [
                              Text(userList[index].address.geo.lat),
                              Text(userList[index].address.geo.lng),
                            ],
                          ));
                    },
                  )
                : LinearProgressIndicator();
          },
        ));
  }
}
