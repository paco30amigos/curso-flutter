import 'package:flutter/material.dart';
import 'package:holaMundo/features/commons/utils/init_hive_db.dart';
import 'package:holaMundo/features/home/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitHiveDB.initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
    );
  }
}
