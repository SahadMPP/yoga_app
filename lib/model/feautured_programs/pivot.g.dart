// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      programId: (json['program_id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'program_id': instance.programId,
      'category_id': instance.categoryId,
    };
