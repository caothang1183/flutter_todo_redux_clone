import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/network/file_storage.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:flutter_todo_redux_clone/repositories/tasks_repository.dart';
import 'package:flutter_todo_redux_clone/repositories/tasks_repository_flutter.dart';
import 'package:flutter_todo_redux_clone/utils/selector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAppMiddleware([
    TasksRepository repository = const TasksRepositoryFlutter(
        fileStorage: const FileStorage(
            "redux_app",
            getApplicationDocumentsDirectory
        ),
    ),
]) {
    final saveTasks = _createSaveTasks(repository);
    final loadTasks = _createLoadTasks(repository);

    return [
        TypedMiddleware<AppState, LoadTasksAction>(loadTasks),
        TypedMiddleware<AppState, AddTaskAction>(saveTasks),
        TypedMiddleware<AppState, UpdateTaskAction>(saveTasks),
        TypedMiddleware<AppState, TasksLoadedAction>(saveTasks),
        TypedMiddleware<AppState, DeleteTaskAction>(saveTasks),
    ];
}

Middleware<AppState> _createLoadTasks(TasksRepository repository) {
    return (Store<AppState> store, action, NextDispatcher next) {
        repository.loadTasks().then(
                (tasks) {
                store.dispatch(
                    TasksLoadedAction(
                        tasks.map(Task.fromEntity).toList(),
                    ),
                );
            },
        ).catchError((_) => store.dispatch(TasksNotLoadedAction()));

        next(action);
    };
}

Middleware<AppState> _createSaveTasks(TasksRepository repository) {
    return (Store<AppState> store, action, NextDispatcher next) {
        next(action);
        repository.saveTasks(tasksSelector(store.state).map((todo) => todo.toEntity()).toList(),
        );
    };
}