import 'package:flutter/material.dart';
import 'package:munchmap_prototype/screens/welcome.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'utility/hive_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path); 
  await Hive.initFlutter();
  final hiveService = HiveService(); 
  await hiveService.initHive();

  runApp(MainApp(hiveService: hiveService));
}

class MainApp extends StatelessWidget {
  final HiveService hiveService;

  const MainApp({super.key, required this.hiveService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MunchMap Prototype',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(hiveService: hiveService), // Pass the hiveService to WelcomePage
    );
  }
}
