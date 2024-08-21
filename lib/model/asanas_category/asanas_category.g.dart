// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asanas_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsanasCategory _$AsanasCategoryFromJson(Map<String, dynamic> json) =>
    AsanasCategory(
      success: json['success'] as bool?,
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Datum.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$AsanasCategoryToJson(AsanasCategory instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
