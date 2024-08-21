import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diet.g.dart';

@JsonSerializable()
class Diet extends Equatable {
  final int? id;
  @JsonKey(name: 'cat_id')
  final int? catId;
  final String? name;
  final String? type;
  final int? calories;
  final int? carbs;
  final int? protein;
  final int? fat;
  final String? servings;
  final int? time;
  @JsonKey(name: 'is_featured')
  final int? isFeatured;
  final String? description;
  final String? ingredients;
  final String? photo;
  final int? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Diet({
    this.id,
    this.catId,
    this.name,
    this.type,
    this.calories,
    this.carbs,
    this.protein,
    this.fat,
    this.servings,
    this.time,
    this.isFeatured,
    this.description,
    this.ingredients,
    this.photo,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Diet.fromJson(Map<String, dynamic> json) => _$DietFromJson(json);

  Map<String, dynamic> toJson() => _$DietToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      catId,
      name,
      type,
      calories,
      carbs,
      protein,
      fat,
      servings,
      time,
      isFeatured,
      description,
      ingredients,
      photo,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
