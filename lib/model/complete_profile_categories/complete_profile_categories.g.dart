// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_profile_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteProfileCategories _$CompleteProfileCategoriesFromJson(
        Map<String, dynamic> json) =>
    CompleteProfileCategories(
      success: json['success'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CompleteProfileCategoriesToJson(
        CompleteProfileCategories instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };
