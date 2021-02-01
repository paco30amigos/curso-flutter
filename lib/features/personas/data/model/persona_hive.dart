import 'package:hive/hive.dart';
import 'package:holaMundo/features/commons/utils/constants.dart';
part 'persona_hive.g.dart';

@HiveType(typeId: Constants.PERSON_TYPE)
class PersonaHive {
  @HiveField(0)
  String id;
  @HiveField(1)
  String nombres;
  @HiveField(2)
  String apellidos;
  @HiveField(3)
  String documento;
}
