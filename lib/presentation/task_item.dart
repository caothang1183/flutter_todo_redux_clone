import 'package:flutter/material.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';

class TaskItem extends StatelessWidget {
    final DismissDirectionCallback onDismissed;
    final GestureTapCallback onTap;
    final ValueChanged<bool> onCheckboxChanged;
    final Task task;

    TaskItem({
        @required this.onDismissed,
        @required this.onTap,
        @required this.onCheckboxChanged,
        @required this.task,
    });

    @override
    Widget build(BuildContext context) {
        return Dismissible(
            key: Key("task_item_${task.id}"),
            onDismissed: onDismissed,
            child: ListTile(
                onTap: onTap,
                leading: Checkbox(
                    key: Key("cb_task_item_${task.id}"),
                    value: task.complete,
                    onChanged: onCheckboxChanged,
                ),
                title: Hero(
                    tag: '${task.id}__heroTag',
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            task.task,
                            key:  Key("task_item_${task.id}"),
                            style: Theme.of(context).textTheme.title,
                        ),
                    ),
                ),
                subtitle: Text(
                    task.note,
                    key:  Key("note_task_item_${task.id}"),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subhead,
                ),
            ),
        );
    }
}
