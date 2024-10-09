import 'package:compromissos/model/task.dart';
import 'package:compromissos/repository/compromisso_repository.dart';
import 'package:flutter/material.dart';
import 'package:compromissos/screens/shared/custom_text_field.dart';
import 'package:flutter_masked_text3/flutter_masked_text3.dart';
import 'package:provider/provider.dart';

class EditCompromisso extends StatelessWidget {
  EditCompromisso({super.key}); // Adicionando o parâmetro key

  final _compromissoController = TextEditingController();
  final _dataController = MaskedTextController(mask: '00/00/0000');
  final _horarioController = MaskedTextController(mask: '00:00');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;
    _compromissoController.text = task.compromisso;
    _dataController.text = task.data;
    _horarioController.text = task.horario;
    final repository = Provider.of<CompromissoRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Editar ${task.compromisso}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            SnackBar snackBar;
            try {
              task.compromisso = _compromissoController.text;
              task.data = _dataController.text;
              task.horario = _horarioController.text;
              repository.update(task.toMap());
              if (task.id != 0) {
                snackBar = SnackBar(
                    content:
                        Text('${task.compromisso} atualizado com sucesso!!!'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                snackBar = SnackBar(
                    content: Text(
                        'Não foi possível atualizar o compromisso ${task.compromisso}!!!'));
              }
            } catch (e) {
              snackBar = const SnackBar(
                  content: Text('Ops. Houve um erro inesperado!!!'));
            }
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          Navigator.pop(context);
        },
        child: const Icon(Icons.check),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
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
    );
  }
}
