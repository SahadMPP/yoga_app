// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_diets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDiets _$GetDietsFromJson(Map<String, dynamic> json) => GetDiets(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetDietsToJson(GetDiets instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
