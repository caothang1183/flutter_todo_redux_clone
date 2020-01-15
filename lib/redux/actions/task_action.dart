import 'package:flutter_todo_redux_clone/models/task.dart';

class LoadTasksAction {}

class TasksNotLoadedAction {}

class TasksLoadedAction {
    final List<Task> tasks;

    TasksLoadedAction(this.tasks);

    @override
    String toString() {
        return 'TasksLoadedAction{tasks: $tasks}';
    }
}

class UpdateTaskAction {
    final String id;
    final Task updatedTask;

    UpdateTaskAction(this.id, this.updatedTask);

    @override
    String toString() {
        return 'UpdateTaskAction{id: $id, updatedTask: $updatedTask}';
    }
}

class DeleteTaskAction {
    final String id;

    DeleteTaskAction(this.id);

    @override
    String toString() {
        return 'DeleteTaskAction{id: $id}';
    }
}

class AddTaskAction {
    final Task task;

    AddTaskAction(this.task);

    @override
    String toString() {
        return 'AddTaskAction{task: $task}';
    }
}