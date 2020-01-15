import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/redux/reducers/task_reducer.dart';

import 'loading_reducer.dart';

AppState appReducer(AppState state, action) {
    return AppState(
        isLoading: loadingReducer(state.isLoading, action),
        tasks: taskReducer(state.tasks, action)
    );
}