// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      photo: json['photo'] as String?,
      weight: json['weight'] as String?,
      height: json['height'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      goals:
          (json['goals'] as List<dynamic>?)?.map((e) => e as String).toList(),
      diseases: (json['diseases'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      dietPreference: (json['diet_preference'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'photo': instance.photo,
      'weight': instance.weight,
      'height': instance.height,
      'gender': instance.gender,
      'date_of_birth': instance.dateOfBirth,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'goals': instance.goals,
      'diseases': instance.diseases,
      'location': instance.location,
      'bio': instance.bio,
      'diet_preference': instance.dietPreference,
    };
