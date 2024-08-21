// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfile _$GetProfileFromJson(Map<String, dynamic> json) => GetProfile(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProfileToJson(GetProfile instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
