import 'package:compromissos/repository/compromisso_repository.dart';
import 'package:compromissos/screens/edit_compromisso/edit_compromisso.dart';
import 'package:compromissos/screens/tasks/tasks_page.dart';
import 'package:compromissos/store/task_store.dart';
import 'package:flutter/material.dart';
import 'package:compromissos/screens/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<TasksStore>(
          create: (_) => TasksStore(),
        ),
        Provider<CompromissoRepository>(
          create: (_) => CompromissoRepository(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorSchemeSeed: const Color.fromARGB(255, 47, 86, 70),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/home',
          routes: {
            '/home': (_) => HomePage(),
            '/tasks': (_) => TasksPage(),
            "/edit": (_) => EditCompromisso(),
          }),
    ),
  );
}
