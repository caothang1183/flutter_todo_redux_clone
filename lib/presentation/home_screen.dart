import 'package:flutter/material.dart';
import 'package:flutter_todo_redux_clone/container/filtered_task_list.dart';

import '../routes.dart';

class HomeScreen extends StatefulWidget {
    final void Function() onInit;

    HomeScreen({Key key, this.onInit}) : super(key: key);

    @override
    _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    @override
    void initState() {
        widget.onInit();
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Task List"),
            ),
            body: FilteredTaskList(),
            floatingActionButton: FloatingActionButton(
                onPressed: () => Navigator.pushNamed(context, AppRoutes.addTask),
//                key: Key("add_task"),
                child: Icon(Icons.add),
            ),
        );
    }
}