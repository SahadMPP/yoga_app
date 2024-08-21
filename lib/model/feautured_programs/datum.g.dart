// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      coachId: (json['coach_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      photo: json['photo'] as String?,
      duration: json['duration'] as String?,
      difficulty: json['difficulty'] as String?,
      description: json['description'] as String?,
      benefits: json['benefits'] as String?,
      isFeatured: (json['is_featured'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'title': instance.title,
      'photo': instance.photo,
      'duration': instance.duration,
      'difficulty': instance.difficulty,
      'description': instance.description,
      'benefits': instance.benefits,
      'is_featured': instance.isFeatured,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'categories': instance.categories,
    };
