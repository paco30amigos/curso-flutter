import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mi primer app!'),
        ),
        drawer: Drawer(
            child: Text(
          "MENU",
          style: TextStyle(fontSize: 50),
        )),
        body: Center(
          child: Container(
            child: Text('Hola mundo!'),
          ),
        ),
      ),
    );
  }
}
