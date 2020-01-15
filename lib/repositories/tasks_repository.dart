import 'package:flutter_todo_redux_clone/entities/task_entity.dart';

abstract class TasksRepository {

    Future<List<TaskEntity>> loadTasks();

    // Persists todos to local disk and the web
    Future saveTasks(List<TaskEntity> tasks);
}
