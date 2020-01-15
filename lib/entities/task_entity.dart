import 'package:json_annotation/json_annotation.dart';
part 'task_entity.g.dart';

@JsonSerializable()
class TaskEntity {
    final bool complete;
    final String id;
    final String note;
    final String task;

    TaskEntity(this.task, this.id, this.note, this.complete);
//
//    @override
//    int get hashCode => complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;
//
//    @override
//    bool operator ==(Object other) =>
//        identical(this, other) ||
//            other is TaskEntity &&
//                runtimeType == other.runtimeType &&
//                complete == other.complete &&
//                task == other.task &&
//                note == other.note &&
//                id == other.id;

    @override
    String toString() {
        return 'TodoEntity{complete: $complete, task: $task, note: $note, id: $id}';
    }

    factory TaskEntity.fromJson(Map<String, dynamic> json)=>
        _$TaskEntityFromJson(json);

    Map<String, dynamic> toJson() => _$TaskEntityToJson(this);


//    Map<String, Object> toJson() {
//        return {
//            "complete": complete,
//            "task": task,
//            "note": note,
//            "id": id,
//        };
//    }
//
//    static TaskEntity fromJson(Map<String, Object> json) {
//        return TaskEntity(
//            json["task"] as String,
//            json["id"] as String,
//            json["note"] as String,
//            json["complete"] as bool,
//        );
//    }
}
