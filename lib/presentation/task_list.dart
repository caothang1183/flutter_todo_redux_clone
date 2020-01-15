import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux_clone/container/task_details.dart';
import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/presentation/task_item.dart';
import 'package:redux/redux.dart';

class TaskList extends StatelessWidget {
    final List<Task> tasks;
    final Function(Task, bool) onCheckboxChanged;
    final Function(Task) onRemove;
    final Function(Task) onUndoRemove;

    const TaskList({Key key, this.tasks, this.onCheckboxChanged, this.onRemove, this.onUndoRemove}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, bool>(
            distinct: true,
            converter: (Store<AppState> store) => isLoadingSelector(store.state),
            builder: (context, loading) {
                return loading
                    ? Center(child: CircularProgressIndicator(key: Key("loading_task")))
                    : _buildListView();
            });
    }

    ListView _buildListView() {
        return ListView.builder(
            key: Key("task_list"),
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) {
                final task = tasks[index];
                return TaskItem(
                    task: task,
                    onDismissed: (direction) => _removeTask(context, task),
                    onTap: () => _onTaskTap(context, task),
                    onCheckboxChanged: (complete) {
                        onCheckboxChanged(task, complete);
                    },
                );
            },
        );
    }

    void _removeTask(BuildContext context, Task task) {
        onRemove(task);
        Scaffold.of(context).showSnackBar(
            SnackBar(
                duration: Duration(seconds: 3),
                backgroundColor: Theme.of(context).backgroundColor,
                content: Text(
                    "Task ${task.task} deleted",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                ),
                action: SnackBarAction(
                    label: "Undo",
                    onPressed: () => onUndoRemove(task),
                ),
            ),
        );
    }

    void _onTaskTap(BuildContext context, Task task) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => TaskDetails(id: task.id),
        ))
            .then((removedTodo) {
            if (removedTodo != null) {
                Scaffold.of(context).showSnackBar(
                    SnackBar(
                        key:Key("snack_bar"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Theme.of(context).backgroundColor,
                        content: Text(
                            "Task ${task.task} deleted",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                        ),
                        action: SnackBarAction(
                            label: "Undo",
                            onPressed: () => onUndoRemove(task),
                        ),
                    ),
                );
            }
        });
    }

    bool isLoadingSelector(AppState state) => state.isLoading;
}
