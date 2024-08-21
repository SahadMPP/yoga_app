// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asana.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asana _$AsanaFromJson(Map<String, dynamic> json) => Asana(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      duration: json['duration'] as String?,
      difficulty: json['difficulty'] as String?,
      type: (json['type'] as num?)?.toInt(),
      description: json['description'] as String?,
      benefits: json['benefits'] as String?,
      videoUri: json['video_uri'] as String?,
      isVimeo: (json['is_vimeo'] as num?)?.toInt(),
      photo: json['photo'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      pivot: json['pivot'] == null
          ? null
          : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AsanaToJson(Asana instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'duration': instance.duration,
      'difficulty': instance.difficulty,
      'type': instance.type,
      'description': instance.description,
      'benefits': instance.benefits,
      'video_uri': instance.videoUri,
      'is_vimeo': instance.isVimeo,
      'photo': instance.photo,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'pivot': instance.pivot,
    };
