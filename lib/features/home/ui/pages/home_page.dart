import 'package:flutter/material.dart';
import 'package:holaMundo/features/home/ui/widgets/mi_primer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi primer app!'),
      ),
      drawer: Drawer(
          child: Text(
        "MENU",
        style: TextStyle(fontSize: 50),
      )),
      body: Container(
        child: MiPrimerWidget(),
      ),
    );
  }
}
