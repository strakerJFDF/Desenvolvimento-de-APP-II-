// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on _TasksStoreBase, Store {
  Computed<ObservableList<Task>>? _$tasksComputed;

  @override
  ObservableList<Task> get tasks =>
      (_$tasksComputed ??= Computed<ObservableList<Task>>(() => super.tasks,
              name: '_TasksStoreBase.tasks'))
          .value;

  late final _$_tasksAtom =
      Atom(name: '_TasksStoreBase._tasks', context: context);

  @override
  ObservableList<Task> get _tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  set _tasks(ObservableList<Task> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$_TasksStoreBaseActionController =
      ActionController(name: '_TasksStoreBase', context: context);

  @override
  void add(Task task) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction(
        name: '_TasksStoreBase.add');
    try {
      return super.add(task);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void load(List<Task> tasks) {
    final _$actionInfo = _$_TasksStoreBaseActionController.startAction(
        name: '_TasksStoreBase.load');
    try {
      return super.load(tasks);
    } finally {
      _$_TasksStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
