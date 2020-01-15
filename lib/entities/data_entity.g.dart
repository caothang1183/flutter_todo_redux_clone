// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataEntity _$DataEntityFromJson(Map<String, dynamic> json) {
  return DataEntity(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : TaskEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataEntityToJson(DataEntity instance) =>
    <String, dynamic>{
      'data': instance.tasks,
    };
