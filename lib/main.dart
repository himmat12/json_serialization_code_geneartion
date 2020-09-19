import 'package:flutter/material.dart';
import 'package:json_serialization_code_gen/pages/user_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json Serialization 04\nCode Generation Library"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserPage(),
                    ));
              },
              title: Text("Users - JSON API Data [Code Generation]"),
            ),
          ),
        ],
      ),
    );
  }
}
