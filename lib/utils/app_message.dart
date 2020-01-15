import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppMessages {

    static AppMessages of(BuildContext context) {
        return Localizations.of<AppMessages>(
            context, AppMessages);
    }

    String taskDeleted(String task) => Intl.message(
        'Deleted "$task"',
        name: 'taskDeleted',
        args: [task],
    );

    String get undo => Intl.message(
        'Undo',
        name: 'undo',
        args: []
    );

    String get editTask => Intl.message(
        'Edit Task',
        name: 'editTask',
        args: [],
    );

    String get addTask => Intl.message(
        'Add Task',
        name: 'addTask',
        args: [],
    );

    String get newTaskHint => Intl.message(
        'What needs to be done?',
        name: 'newTaskHint',
        args: [],
    );

    String get emptyTaskError => Intl.message(
        'Please enter some text',
        name: 'emptyTaskError',
        args: [],
    );

    String get notesHint => Intl.message(
        'Additional Notes...',
        name: 'notesHint',
        args: [],
    );

    String get saveChanges => Intl.message(
        'Save changes',
        name: 'saveChanges',
        args: [],
    );


}