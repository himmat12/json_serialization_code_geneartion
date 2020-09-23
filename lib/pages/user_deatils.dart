import 'package:flutter/material.dart';
import 'package:json_serialization_code_gen/models/user_model.dart';
import 'package:json_serialization_code_gen/services/user_service.dart';

class UserDetailsPage extends StatefulWidget {
  final int id;
  UserDetailsPage({@required this.id});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder(
        future: userService.getUser(id: widget.id.toString()),
        builder: (context, snapshot) {
          List<User> userList = snapshot.data;

          return !snapshot.hasData
              ? LinearProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('id :' + userList[0].id.toString()),
                      Text('name : ' + userList[0].name),
                      Text('username : ' + userList[0].username),
                      Text('email : ' + userList[0].email),
                      Text('phone : ' + userList[0].phone),
                      Text('city : ' + userList[0].address.city),
                      Text('street : ' + userList[0].address.street),
                      Text('suite : ' + userList[0].address.suite),
                      Text('zipcode : ' + userList[0].address.zipcode),
                      Text('geo.lat : ' + userList[0].address.geo.lat),
                      Text('geo.lng : ' + userList[0].address.geo.lng),
                      Text('website : ' + userList[0].website),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
