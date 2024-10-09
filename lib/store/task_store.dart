import 'package:compromissos/model/task.dart';
import 'package:mobx/mobx.dart';
part 'task_store.g.dart';

class TasksStore = _TasksStoreBase with _$TasksStore;

abstract class _TasksStoreBase with Store {
  @observable
  ObservableList<Task> _tasks =
      List<Task>.empty(growable: true).asObservable();

  @computed
  ObservableList<Task> get tasks => _tasks;

  @action
  void add(Task task) {
    _tasks.add(task);
  }

  void remove(int id) {
    _tasks.removeWhere(
      (e) => e.id == id,
    );
  }

  @action
  void load(List<Task> tasks) {
    _tasks.addAll(tasks);
  }
}