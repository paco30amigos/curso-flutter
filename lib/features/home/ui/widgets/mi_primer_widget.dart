import 'package:flutter/material.dart';

class MiPrimerWidget extends StatelessWidget {
  const MiPrimerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("texto1"),
          Text("texto2"),
          Text("texto3"),
          Column(
            children: [
              Text("columna 1"),
              Text("columna 2"),
              Text("columna 3"),
              Row(
                children: [
                  Icon(Icons.supervised_user_circle),
                  Icon(Icons.ac_unit),
                  Text("columna 3"),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
