import 'package:compromissos/model/task.dart';
import 'package:compromissos/repository/db_helper.dart';

class CompromissoRepository {
  static const _tableName = 'compromisso';

  Future<int> insert(Map<String, Object?> map) async {
    final db = await DBHelper.getInstancia();
    return await db.insert(_tableName, map);
  }

  Future<List<Task>> findAll() async {
    final db = await DBHelper.getInstancia();
    final result = await db.query(_tableName);
    return result
        .map(
          (item) => Task.fromMap(item),
        )
        .toList();
  }

  Future<int> update(Map<String, Object?> map) async {
    final db = await DBHelper.getInstancia();
    return await db
        .update(_tableName, map, where: 'id=?', whereArgs: [map['id']]);
  }

  Future<int> delete(int id) async {
    final db = await DBHelper.getInstancia();
    return await db.delete(
      _tableName,
      where: 'id=?',
      whereArgs: [id],
    );
  }
}

