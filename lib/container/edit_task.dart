import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_todo_redux_clone/models/app_state.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';
import 'package:flutter_todo_redux_clone/presentation/add_edit_screen.dart';
import 'package:flutter_todo_redux_clone/redux/actions/task_action.dart';
import 'package:redux/redux.dart';

class EditTask extends StatelessWidget {
    final Task task;

    EditTask({this.task, Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return StoreConnector<AppState, OnSaveCallback>(
            converter: (Store<AppState> store) {
                return (_task, _note) {
                    store.dispatch(UpdateTaskAction(
                        task.id,
                        task.copyWith(
                            task: _task,
                            note: _note,
                        ),
                    ));
                };
            },
            builder: (BuildContext context, OnSaveCallback onSave) {
                return AddEditScreen(
                    key: Key("edit_task_screen"),
                    onSave: onSave,
                    isEditing: true,
                    task: task,
                );
            },
        );
    }
}
