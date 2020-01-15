import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
    final bool isLoading;
    final List<Task> tasks;

    AppState({this.isLoading = false, this.tasks = const[]});

    factory AppState.loading() => AppState(isLoading: true);

    AppState copyWith({bool isLoading, List<Task> tasks,}) {
        return AppState(isLoading: isLoading ?? this.isLoading, tasks: tasks ?? this.tasks);
    }

    @override
    int get hashCode => isLoading.hashCode ^ tasks.hashCode;

    @override
    bool operator ==(Object other) =>
        identical(this, other) || other is AppState &&
            runtimeType == other.runtimeType &&
            isLoading == other.isLoading &&
            tasks == other.tasks;

    @override
    String toString() {
        return 'AppState{isLoading: $isLoading, todos: $tasks}';
    }
}