import 'package:flutter/material.dart';

class ListDatos extends StatelessWidget {
  const ListDatos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: Icon(Icons.alarm),
              trailing: Icon(Icons.arrow_forward),
              title: Text("HOLA $index"),
              subtitle: Text("subtitulo"),
              onTap: () {
                print("TAP");
              },
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
