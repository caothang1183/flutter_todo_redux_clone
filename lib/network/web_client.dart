import 'dart:convert';

import 'package:flutter_todo_redux_clone/entities/data_entity.dart';
import 'package:flutter_todo_redux_clone/entities/task_entity.dart';
import 'package:http/http.dart' as http;

class WebClient {
    final Duration delay;

    const WebClient([this.delay = const Duration(milliseconds: 10000)]);

    Future<List<TaskEntity>> fetchTasks() async {
        List<TaskEntity> tasks = [];
        final response = await http.get("http://my-json-server.typicode.com/caothang1183/apitaskstest/db");
        if (response.statusCode == 200) {
            DataEntity dataEntity = DataEntity.fromJson(jsonDecode(response.body));
            tasks = dataEntity.tasks;
        }
        return tasks;
    }

    Future<bool> postTasks(List<TaskEntity> task) async {
        return Future.value(true);
    }
}