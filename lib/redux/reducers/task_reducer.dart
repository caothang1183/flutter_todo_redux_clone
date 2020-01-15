import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:redux/redux.dart';

final taskReducer = combineReducers<List<Task>>([
    TypedReducer<List<Task>, AddTaskAction>(_addTodo),
    TypedReducer<List<Task>, DeleteTaskAction>(_deleteTodo),
    TypedReducer<List<Task>, UpdateTaskAction>(_updateTodo),
    TypedReducer<List<Task>, TasksLoadedAction>(_setLoadedTasks),
    TypedReducer<List<Task>, TasksNotLoadedAction>(_setNoTasks),
//    TypedReducer<List<Todo>, ClearCompletedAction>(_clearCompleted),
//    TypedReducer<List<Todo>, ToggleAllAction>(_toggleAll),
]);

List<Task> _addTodo(List<Task> tasks, AddTaskAction action) {
    return List.from(tasks)
        ..add(action.task);
}

List<Task> _deleteTodo(List<Task> tasks, DeleteTaskAction action) {
    return tasks.where((task) => task.id != action.id).toList();
}

List<Task> _updateTodo(List<Task> tasks, UpdateTaskAction action) {
    return tasks
        .map((task) => task.id == action.id ? action.updatedTask : task)
        .toList();
}

List<Task> _setLoadedTasks(List<Task> tasks, TasksLoadedAction action) {
    return action.tasks;
}

List<Task> _setNoTasks(List<Task> tasks, TasksNotLoadedAction action) {
    return [];
}