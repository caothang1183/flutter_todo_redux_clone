import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/presentation/detail_screen.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:flutter_todo_redux_clone/utils/selector.dart';
import 'package:redux/redux.dart';

class TaskDetails extends StatelessWidget {
    final String id;

    TaskDetails({Key key, @required this.id}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            ignoreChange: (state) => taskSelector(state.tasks, id).isNotPresent,
            converter: (Store<AppState> store) {
                return _ViewModel.from(store, id);
            },
            builder: (context, vm) {
                return DetailsScreen(
                    task: vm.task,
                    onDelete: vm.onDelete,
                    toggleCompleted: vm.toggleCompleted,
                );
            },
        );
    }
}

class _ViewModel {
    final Task task;
    final Function onDelete;
    final Function(bool) toggleCompleted;

    _ViewModel({
        @required this.task,
        @required this.onDelete,
        @required this.toggleCompleted,
    });

    factory _ViewModel.from(Store<AppState> store, String id) {
        final task = taskSelector(tasksSelector(store.state), id).value;

        return _ViewModel(
            task: task,
            onDelete: () => store.dispatch(DeleteTaskAction(task.id)),
            toggleCompleted: (isComplete) {
                store.dispatch(UpdateTaskAction(
                    task.id,
                    task.copyWith(complete: isComplete),
                ));
            },
        );
    }
}
