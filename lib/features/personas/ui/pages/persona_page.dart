import 'package:flutter/material.dart';
import 'package:holaMundo/features/commons/utils/dependencies.dart';
import 'package:holaMundo/features/personas/data/model/persona_hive.dart';

class PersonaPage extends StatefulWidget {
  PersonaPage({Key key}) : super(key: key);

  @override
  _PersonaPageState createState() => _PersonaPageState();
}

Future<List<PersonaHive>> getPersonas() {
  return Dependencies.personaServiceImpl.findMany({"nombres": "paco"});
}

class _PersonaPageState extends State<PersonaPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: onNewPressed,
        ),
        Expanded(
          child: FutureBuilder(
            future: getPersonas(),
            builder: (context, AsyncSnapshot<List<PersonaHive>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final personasList = snapshot.data;
                return ListView.builder(
                  itemCount: personasList.length,
                  itemBuilder: (context, index) {
                    return getPersonasList(context, personasList[index]);
                  },
                  shrinkWrap: true,
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
      ],
    );
  }

  ListTile getPersonasList(BuildContext context, PersonaHive persona) {
    return ListTile(
      title: Text("${persona.nombres} ${persona.apellidos}"),
      subtitle: Text(persona.documento),
      trailing: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => showItemOptions(context, persona),
      ),
    );
  }

  void showItemOptions(BuildContext context, PersonaHive persona) {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        builder: (context) => ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Eliminar"),
                  onTap: () => onDeletedPressed(context, persona),
                ),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text("Actualizar"),
                  onTap: () => onEditPressed(context, persona),
                )
              ],
              shrinkWrap: true,
            ));
  }

  void onNewPressed() async {
    await Dependencies.personaServiceImpl.insert(PersonaHive()
      ..nombres = "paco30amigos"
      ..apellidos = "informática"
      ..documento = DateTime.now().microsecondsSinceEpoch.toString());
    setState(() {});
  }

  void onDeletedPressed(BuildContext context, PersonaHive persona) async {
    Dependencies.personaServiceImpl.delete(persona);
    setState(() {});
    Navigator.pop(context);
  }

  void onEditPressed(BuildContext context, PersonaHive persona) async {
    await Dependencies.personaServiceImpl.update(persona
      ..nombres = "paco modificado"
      ..apellidos = "informática"
      ..documento = DateTime.now().microsecondsSinceEpoch.toString());
    setState(() {});
    Navigator.pop(context);
  }
}
