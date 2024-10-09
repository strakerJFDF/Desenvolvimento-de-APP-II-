class Task {
  int? id;
  String compromisso;
  String data;
  String horario;
  Task({
    this.id,
    required this.compromisso,
    required this.data,
    required this.horario,
  });
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'compromisso': compromisso,
      'data': data,
      'horario': horario,
    };
  }

  factory Task.fromMap(Map<String, Object?> map) => Task(
        id: map['id'] as int?,
        compromisso: map['compromisso'] as String,
        data: map['data'] as String,
        horario: map['horario'] as String,
      );
}
