// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      asanasCategoryId: (json['asanas_category_id'] as num?)?.toInt(),
      asanaId: (json['asana_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'asanas_category_id': instance.asanasCategoryId,
      'asana_id': instance.asanaId,
    };
