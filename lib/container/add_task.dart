import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/presentation/add_edit_screen.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:redux/redux.dart';

class AddTask extends StatelessWidget {
    final Task task;

    AddTask({this.task, Key key}) : super(key: key);

    Widget build(BuildContext context) {
        return StoreConnector<AppState, OnSaveCallback>(
            converter: (Store<AppState> store) {
                return (task, note) {
                    store.dispatch(AddTaskAction(Task(task, note: note)));
                };
            },
            builder: (BuildContext context, OnSaveCallback onSave) {
                return AddEditScreen(
                    onSave: onSave,
                    isEditing: false,
                );
            },
        );
    }
}
