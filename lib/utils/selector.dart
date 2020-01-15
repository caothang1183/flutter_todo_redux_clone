import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';

import 'optional.dart';

List<Task> tasksSelector(AppState state) => state.tasks;

Optional<Task> taskSelector(List<Task> tasks, String id) {
    try {
        return Optional.of(tasks.firstWhere((task) => task.id == id));
    } catch (e) {
        return Optional.absent();
    }
}