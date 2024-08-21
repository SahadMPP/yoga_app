// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asanas_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsanasList _$AsanasListFromJson(Map<String, dynamic> json) => AsanasList(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AsanasListToJson(AsanasList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
