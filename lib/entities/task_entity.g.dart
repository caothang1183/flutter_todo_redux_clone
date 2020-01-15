// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) {
  return TaskEntity(
    json['task'] as String,
    json['_id'] as String,
    json['note'] as String,
    json['complete'] as bool,
  );
}

Map<String, dynamic> _$TaskEntityToJson(TaskEntity instance) =>
    <String, dynamic>{
      'complete': instance.complete,
      '_id': instance.id,
      'note': instance.note,
      'task': instance.task,
    };
