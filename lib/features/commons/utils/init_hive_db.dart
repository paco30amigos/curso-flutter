import 'dart:io';

import 'package:hive/hive.dart';
import 'package:holaMundo/features/personas/data/model/persona_hive.dart';
import 'package:path_provider/path_provider.dart';

class InitHiveDB {
  static Future<void> initHive() async {
    Directory dbFile = await getApplicationDocumentsDirectory();
    Hive.init(dbFile.path);
    //registrar adapters
    Hive.registerAdapter(PersonaHiveAdapter());
  }
}
