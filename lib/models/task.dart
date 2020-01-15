import 'package:flutter_todo_redux_clone/entities/task_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Task {
    final bool complete;
    final String note;
    final String task;
    final String id;

    Task(this.task, {this.complete = false, this.id, this.note = ''});

    Task copyWith({bool complete, String note, String task, String id}) {
        return Task(
            task ?? this.task,
            complete: complete ?? this.complete,
            note: note ?? this.note,
            id: id ?? this.id,
        );
    }

    @override
    int get hashCode => complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
            other is Task &&
                runtimeType == other.runtimeType &&
                complete == other.complete &&
                task == other.task &&
                note == other.note &&
                id == other.id;

    @override
    String toString() {
        return 'Todo{complete: $complete, task: $task, note: $note, id: $id}';
    }

    TaskEntity toEntity() {
        return TaskEntity(task, id, note, complete);
    }

    static Task fromEntity(TaskEntity entity) {
        return Task(
            entity.task,
            complete: entity.complete ?? false,
            note: entity.note,
            id: entity.id,
        );
    }
}