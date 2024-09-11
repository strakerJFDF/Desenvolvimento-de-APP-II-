import 'package:flutter/material.dart';
import 'package:compromissos/screens/home/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(255, 31, 68, 53),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
