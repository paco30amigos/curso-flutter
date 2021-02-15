import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Nombre extends StatelessWidget {
  const Nombre({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: FormBuilderTextField(
          name: "nombre",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: 'Nombre',
            hintText: "Ingrese valor",
            prefixIcon: Icon(Icons.supervised_user_circle_rounded),
            suffixIcon: Icon(Icons.cancel),
            border: new OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: new BorderSide(color: Colors.teal)),
          ),
          maxLength: 5,
          validator: FormBuilderValidators.required(context,
              errorText: "Valor requerido")),
    );
  }
}
