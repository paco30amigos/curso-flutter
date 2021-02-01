import 'package:hive/hive.dart';
import 'package:holaMundo/features/commons/data/services/abstract_hive_crud.dart';
import 'package:holaMundo/features/commons/utils/dependencies.dart';
import 'package:holaMundo/features/personas/data/model/persona_hive.dart';
import 'package:objectid/objectid.dart';

class PersonaServiceImpl implements AbstractHiveCrud<PersonaHive> {
  @override
  Future<bool> delete(PersonaHive data) async {
    bool ret = false;
    try {
      Box<PersonaHive> box = await Dependencies.personaBox();
      await box.delete(data.id);
      ret = true;
    } catch (e) {
      print("no se pudo eliminar");
    }
    return ret;
  }

  @override
  Future<List<PersonaHive>> findMany(filters) async {
    Box<PersonaHive> box = await Dependencies.personaBox();
    await Future.delayed(Duration(seconds: 1));
    final nombres = filters['nombres'];
    final List<PersonaHive> result =
        box.values.where((actual) => actual.nombres.contains(nombres)).toList();
    return result;
  }

  @override
  Future<PersonaHive> findOne(filters) async {
    Box<PersonaHive> box = await Dependencies.personaBox();
    final nombres = filters['nombres'];
    final PersonaHive result = box.values
        .firstWhere((actual) => actual.nombres = nombres, orElse: null);
    return result;
  }

  @override
  Future<PersonaHive> insert(PersonaHive data) async {
    Box<PersonaHive> box = await Dependencies.personaBox();
    final id = ObjectId().hexString;
    data.id = id;
    await box.put(id, data);
    return data;
  }

  @override
  Future<PersonaHive> update(PersonaHive data) async {
    Box<PersonaHive> box = await Dependencies.personaBox();
    await box.put(data.id, data);
    return data;
  }
}
