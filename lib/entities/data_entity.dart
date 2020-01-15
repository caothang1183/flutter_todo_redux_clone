import 'package:flutter_todo_redux_clone/entities/task_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_entity.g.dart';

@JsonSerializable()
class DataEntity {
    final List<TaskEntity> tasks;

    DataEntity(this.tasks);

    factory DataEntity.fromJson(Map<String, dynamic> json)=>
        _$DataEntityFromJson(json);

    Map<String, dynamic> toJson() => _$DataEntityToJson(this);
}
