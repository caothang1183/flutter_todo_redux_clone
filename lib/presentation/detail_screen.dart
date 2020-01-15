import 'package:flutter/material.dart';
import 'package:flutter_todo_redux_clone/container/edit_task.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';

class DetailsScreen extends StatelessWidget {
    final Task task;
    final Function onDelete;
    final Function(bool) toggleCompleted;

    DetailsScreen({
        Key key,
        @required this.task,
        @required this.onDelete,
        @required this.toggleCompleted,
    }) : super(key: key ??Key("detail_screen"));

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                title: Text("Task Details"),
                actions: [
                    IconButton(
                        tooltip: "Delete Task",
                        key: Key("btn_delete_task"),
                        icon: Icon(Icons.delete),
                        onPressed: () {
                            onDelete();
                            Navigator.pop(context, task);
                        },
                    )
                ],
            ),
            body: Padding(
                padding: EdgeInsets.all(16.0),
                child: ListView(
                    children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Checkbox(
                                        value: task.complete,
                                        onChanged: toggleCompleted,
                                    ),
                                ),
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Hero(
                                                tag: '${task.id}__heroTag',
                                                child: Container(
                                                    width: MediaQuery.of(context).size.width,
                                                    padding: EdgeInsets.only(
                                                        top: 8.0,
                                                        bottom: 16.0,
                                                    ),
                                                    child: Text(
                                                        task.task,
                                                        key: Key("detail_task_item_${task.id}"),
                                                        style: Theme.of(context).textTheme.headline,
                                                    ),
                                                ),
                                            ),
                                            Text(
                                                task.note,
                                                key: Key("detail_note_task_item_${task.id}"),
                                                style: Theme.of(context).textTheme.subhead,
                                            ),
                                        ],
                                    ),
                                ),
                            ],
                        ),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
                key: Key("edit_task"),
                tooltip: "Edit Task",
                child: Icon(Icons.edit),
                onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) {
                                return EditTask(
                                    task: task,
                                );
                            },
                        ),
                    );
                },
            ),
        );
    }
}
