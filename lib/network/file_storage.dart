import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_todo_redux_clone/entities/task_entity.dart';

class FileStorage {
    final String tag;
    final Future<Directory> Function() getDirectory;

    const FileStorage(this.tag,
        this.getDirectory);

    Future<List<TaskEntity>> loadTasks() async {
        final file = await _getLocalFile();
        final string = await file.readAsString();
        final json = JsonDecoder().convert(string);
        final tasks = (json['data'])
            .map<TaskEntity>((task) => TaskEntity.fromJson(task))
            .toList();
        return tasks;
    }

    Future<File> saveTasks(List<TaskEntity> tasks) async {
        final file = await _getLocalFile();
        return file.writeAsString(JsonEncoder().convert({
            'data': tasks.map((task) => task.toJson()).toList(),
        }));
    }

    Future<File> _getLocalFile() async {
        final dir = await getDirectory();

        return File('${dir.path}/AppStorage__$tag.json');
    }

    Future<FileSystemEntity> clean() async {
        final file = await _getLocalFile();

        return file.delete();
    }
}
