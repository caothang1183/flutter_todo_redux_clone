import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux_clone/presentation/home_screen.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:flutter_todo_redux_clone/redux/middleware/app_middleware.dart';
import 'package:flutter_todo_redux_clone/redux/reducers/app_state_reducer.dart';
import 'package:flutter_todo_redux_clone/routes.dart';
import 'package:flutter_todo_redux_clone/ui/theme.dart';
import 'package:redux/redux.dart';

import 'container/add_task.dart';
import 'models/app_state.dart';

void main() => runApp(App());

class App extends StatelessWidget {

    final store = Store<AppState>(
        appReducer,
        initialState: AppState.loading(),
        middleware: createAppMiddleware(),
    );

    @override
    Widget build(BuildContext context) {
        return StoreProvider(
            store: store,
            child: MaterialApp(
                title: "Task Redux",
                theme: AppTheme.theme,
                routes: {
                    AppRoutes.home: (context) {
                        return HomeScreen(
                            onInit: () => StoreProvider.of<AppState>(context).dispatch(LoadTasksAction())
                        );
                    },
                    AppRoutes.addTask: (context) {
                        return AddTask();
                    },
                },
            ),
        );
    }
}

