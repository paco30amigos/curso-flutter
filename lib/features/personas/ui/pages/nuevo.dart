import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:holaMundo/features/commons/utils/dependencies.dart';
import 'package:holaMundo/features/personas/data/model/persona_hive.dart';
import 'package:holaMundo/features/personas/ui/widgets/apellido.dart';
import 'package:holaMundo/features/personas/ui/widgets/documento.dart';
import 'package:holaMundo/features/personas/ui/widgets/nombre.dart';

class Nuevo extends StatefulWidget {
  Nuevo({Key key}) : super(key: key);

  @override
  _NuevoState createState() => _NuevoState();
}

class _NuevoState extends State<Nuevo> {
  final _formState = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: guardarPersona,
      ),
      body: FormBuilder(
        key: _formState,
        child: ListView(
          children: [Nombre(), Apellido(), Documento()],
        ),
      ),
    );
  }

  guardarPersona() async {
    bool validacion = _formState.currentState.saveAndValidate();
    if (validacion) {
      print("guardado");
      final valores = _formState.currentState.value;
      final nombre = valores['nombre'];
      final apellido = valores['apellido'];
      final documento = valores['documento'];
      await Dependencies.personaServiceImpl.insert(PersonaHive()
        ..nombres = nombre
        ..apellidos = apellido
        ..documento = documento);
    }
  }
}
