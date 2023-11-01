import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskModel {
  final int id;
  final String description;
  final DateTime dateTime;
  final bool finished;

  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.finished,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'finished': finished,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> task) {
    return TaskModel(
      id: task['id'],
      description: task['description'],
      dateTime: DateTime.parse(task['dateTime']),
      finished: task['finished'] == 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  TaskModel copyWith({
    int? id,
    String? description,
    DateTime? dateTime,
    bool? finished,
  }) {
    return TaskModel(
      id: id ?? this.id,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      finished: finished ?? this.finished,
    );
  }
}
