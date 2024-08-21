// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feautured_programs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeauturedPrograms _$FeauturedProgramsFromJson(Map<String, dynamic> json) =>
    FeauturedPrograms(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeauturedProgramsToJson(FeauturedPrograms instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
