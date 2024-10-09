import 'package:compromissos/model/task.dart';
import 'package:compromissos/repository/compromisso_repository.dart';
import 'package:compromissos/store/task_store.dart';
import 'package:flutter/material.dart';
import 'package:compromissos/screens/shared/custom_text_field.dart';
import 'package:flutter_masked_text3/flutter_masked_text3.dart';
import 'package:provider/provider.dart';

class TasksPage extends StatelessWidget {
  TasksPage({super.key}); // Adicionando o parâmetro key

  final _compromissoController = MaskedTextController();
  final _dataController = MaskedTextController(mask: '00/00/0000');
  final _horarioController = MaskedTextController(mask: '00:00');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final taskstore = Provider.of<TasksStore>(context);
    final repository = Provider.of<CompromissoRepository>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Compromisso'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(37),
        child: Form(
          // Se você precisar usar a formKey para validação, remova o comentário
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: _compromissoController,
                label: 'Compromisso',
                // Adicione outros parâmetros necessários para o CustomTextField, como validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um compromisso';
                  }
                  return null;
                },
                inputType: TextInputType.text, // Exemplo
              ),
              CustomTextField(
                controller: _dataController,
                label: 'Data',
                // Adicione outros parâmetros necessários para o CustomTextField, como validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma data';
                  }
                  return null;
                },
                inputType: TextInputType.number,
              ),
              CustomTextField(
                controller: _horarioController,
                label: 'Horário',
                // Adicione outros parâmetros necessários para o CustomTextField, como validator
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um Horário';
                  }
                  return null;
                },
                inputType: TextInputType.numberWithOptions(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final task = Task(
                compromisso: _compromissoController.text,
                data: _dataController.text,
                horario: _horarioController.text);
            task.id = await repository.insert(task.toMap());
            SnackBar snackBar;
            if (task.id != 0) {
              taskstore.add(task);
              snackBar = SnackBar(content: Text('cadastrado com sucesso!!!'));
              Navigator.pop(context);
            } else {
              snackBar = SnackBar(
                  content: Text('Lamento não foi possível cadastrar !!!'));
            }
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
