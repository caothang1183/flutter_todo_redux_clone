import 'package:flutter/material.dart';
import 'package:flutter_todo_redux_clone/models/task.dart';

typedef OnSaveCallback = Function(String task, String note);

class AddEditScreen extends StatefulWidget {
    final bool isEditing;
    final OnSaveCallback onSave;
    final Task task;

    AddEditScreen({Key key, @required this.onSave, @required this.isEditing, this.task})
        : super(key: key );

    @override
    _AddEditScreenState createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
    static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    String _task;
    String _note;

    bool get isEditing => widget.isEditing;

    @override
    Widget build(BuildContext context) {
        final textTheme = Theme.of(context).textTheme;

        return Scaffold(
            appBar: AppBar(
                title: Text(
                    isEditing ? "Edit Task" : "Add Task",
                ),
            ),
            body: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: ListView(
                        children: [
                            TextFormField(
                                initialValue: isEditing ? widget.task.task : '',
                                key: Key('task_field'),
                                autofocus: !isEditing,
                                style: textTheme.headline,
                                decoration: InputDecoration(
                                    hintText: "What needs to be done?",
                                ),
                                validator: (val) {
                                    return val.trim().isEmpty ? "Please Enter some text" : null;
                                },
                                onSaved: (value) => _task = value,
                            ),
                            TextFormField(
                                initialValue: isEditing ? widget.task.note : '',
                                key: Key('note_field'),
                                maxLines: 10,
                                style: textTheme.subhead,
                                decoration: InputDecoration(
                                    hintText: "Additional Notes...",
                                ),
                                onSaved: (value) => _note = value,
                            )
                        ],
                    ),
                ),
            ),
            floatingActionButton: FloatingActionButton(
                key: isEditing ? Key("save_task") : Key("save_new_task"),
                tooltip: isEditing ? "Save Changes" :"Add Task",
                child: Icon(isEditing ? Icons.check : Icons.add),
                onPressed: () {
                    if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        widget.onSave(_task, _note);
                        Navigator.pop(context);
                    }
                },
            ),
        );
    }
}
