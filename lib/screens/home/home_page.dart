import 'package:compromissos/repository/compromisso_repository.dart';
import 'package:compromissos/screens/home/components/list_item.dart';
import 'package:compromissos/screens/tasks/tasks_page.dart';
import 'package:compromissos/store/task_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskstore = Provider.of<TasksStore>(context);
    final repository = Provider.of<CompromissoRepository>(context);
    return FutureBuilder(
      future: repository.findAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasData) {
          taskstore.load(snapshot.data!);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Compromissos'),
            centerTitle: true,
          ),
          body: 
          Observer(builder: (_) {
            return ListView.builder(
              itemCount: taskstore.tasks.length,
              itemBuilder: (_, index) => ListItem(
                task: taskstore.tasks[index],
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TasksPage()),
              );
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
