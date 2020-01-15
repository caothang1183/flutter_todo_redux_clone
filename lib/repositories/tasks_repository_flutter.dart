import 'package:flutter/material.dart';
import 'package:flutter_todo_redux_clone/entities/task_entity.dart';
import 'package:flutter_todo_redux_clone/network/file_storage.dart';
import 'package:flutter_todo_redux_clone/network/web_client.dart';
import 'package:flutter_todo_redux_clone/repositories/tasks_repository.dart';

class TasksRepositoryFlutter implements TasksRepository {
    final FileStorage fileStorage;
    final WebClient webClient;

    const TasksRepositoryFlutter({@required this.fileStorage, this.webClient = const WebClient()});

    @override
    Future<List<TaskEntity>> loadTasks() async {
        try {
            return await webClient.fetchTasks();
        } catch (e) {
            final tasks = await fileStorage.loadTasks();
            fileStorage.saveTasks(tasks);
            return tasks;
        }
    }

    @override
    Future saveTasks(List<TaskEntity> tasks) {
        return Future.wait<dynamic>([
            fileStorage.saveTasks(tasks),
            webClient.postTasks(tasks),
        ]);
    }
}
