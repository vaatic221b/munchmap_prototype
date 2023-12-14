import 'package:flutter/material.dart';
import 'package:munchmap_prototype/screens/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MunchMap Prototype',
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
    );
  }
}
