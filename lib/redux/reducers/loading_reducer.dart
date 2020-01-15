import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<bool>([
    TypedReducer<bool, TasksLoadedAction>(_setLoaded),
    TypedReducer<bool, TasksNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
    return false;
}
