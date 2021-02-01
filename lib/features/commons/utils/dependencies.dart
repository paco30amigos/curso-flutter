import 'package:hive/hive.dart';
import 'package:holaMundo/features/commons/utils/constants.dart';
import 'package:holaMundo/features/personas/data/model/persona_hive.dart';
import 'package:holaMundo/features/personas/data/services/persona_service_impl.dart';

class Dependencies {
  static final PersonaServiceImpl personaServiceImpl = PersonaServiceImpl();
  static Future<Box<PersonaHive>> personaBox() async {
    Box<PersonaHive> box;
    if (!Hive.isBoxOpen(Constants.PERSON_BOX_NAME)) {
      box = await Hive.openBox(Constants.PERSON_BOX_NAME,
          compactionStrategy: (entries, deletedEntries) {
        return deletedEntries > 50;
      });
    } else {
      box = Hive.box(Constants.PERSON_BOX_NAME);
    }
    return box;
  }
}
