import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/presentation/task_list.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:redux/redux.dart';

class FilteredTaskList extends StatelessWidget {
    FilteredTaskList({Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, _ViewModel>(
            converter: _ViewModel.fromStore,
            builder: (context, vm) {
                return TaskList(
                    tasks: vm.tasks,
                    onCheckboxChanged: vm.onCheckboxChanged,
                    onRemove: vm.onRemove,
                    onUndoRemove: vm.onUndoRemove,
                );
            },
        );
    }
}

class _ViewModel {
    final List<Task> tasks;
    final bool loading;
    final Function(Task, bool) onCheckboxChanged;
    final Function(Task) onRemove;
    final Function(Task) onUndoRemove;

    _ViewModel({
        @required this.tasks,
        @required this.loading,
        @required this.onCheckboxChanged,
        @required this.onRemove,
        @required this.onUndoRemove,
    });

    static _ViewModel fromStore(Store<AppState> store) {
        return _ViewModel(
//            tasks: filteredTodosSelector(
//                todosSelector(store.state),
//                activeFilterSelector(store.state),
//            ),
            tasks: store.state.tasks,
            loading: store.state.isLoading,
            onCheckboxChanged: (task, complete) {
                store.dispatch(UpdateTaskAction(
                    task.id,
                    task.copyWith(complete: !task.complete),
                ));
            },
            onRemove: (todo) {
                store.dispatch(DeleteTaskAction(todo.id));
            },
            onUndoRemove: (todo) {
                store.dispatch(AddTaskAction(todo));
            },
        );
    }
}
