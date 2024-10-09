import 'package:compromissos/model/task.dart';
import 'package:compromissos/repository/compromisso_repository.dart';
import 'package:compromissos/store/task_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final Task task;
  const ListItem({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    final taskstore = Provider.of<TasksStore>(context);
    final repository = Provider.of<CompromissoRepository>(context);
    return Observer(builder: (_) {
      return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .35,
          width: MediaQuery.of(context).size.width * 0.9,
          // Defina a altura desejada
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Compromisso',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/edit',
                                        arguments: task);
                                  },
                                  icon: Icon(Icons.edit)),
                            ]),
                        Text(
                          task.compromisso,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 62, 69, 64),
                          ),
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 83, 79, 79),
                          thickness: 1,
                        ),
                        Text(
                          'Data',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          task.data,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 62, 69, 64),
                          ),
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 83, 79, 79),
                          thickness: 1,
                        ),
                        Text(
                          'Horário',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                        Text(
                          task.horario,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 62, 69, 64),
                          ),
                        ),
                        Divider(
                          color: const Color.fromARGB(255, 83, 79, 79),
                          thickness: 1,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    repository.delete(task.id!);
                                    taskstore.remove(task.id!);
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.delete)),
                              Checkbox(value: true, onChanged: (value) {}),
                            ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
