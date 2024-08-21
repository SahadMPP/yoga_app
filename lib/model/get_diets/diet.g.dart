// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diet _$DietFromJson(Map<String, dynamic> json) => Diet(
      id: (json['id'] as num?)?.toInt(),
      catId: (json['cat_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      calories: (json['calories'] as num?)?.toInt(),
      carbs: (json['carbs'] as num?)?.toInt(),
      protein: (json['protein'] as num?)?.toInt(),
      fat: (json['fat'] as num?)?.toInt(),
      servings: json['servings'] as String?,
      time: (json['time'] as num?)?.toInt(),
      isFeatured: (json['is_featured'] as num?)?.toInt(),
      description: json['description'] as String?,
      ingredients: json['ingredients'] as String?,
      photo: json['photo'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DietToJson(Diet instance) => <String, dynamic>{
      'id': instance.id,
      'cat_id': instance.catId,
      'name': instance.name,
      'type': instance.type,
      'calories': instance.calories,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'fat': instance.fat,
      'servings': instance.servings,
      'time': instance.time,
      'is_featured': instance.isFeatured,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'photo': instance.photo,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
