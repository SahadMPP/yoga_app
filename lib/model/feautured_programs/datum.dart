import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final int? id;
  @JsonKey(name: 'coach_id')
  final int? coachId;
  final String? title;
  final String? photo;
  final String? duration;
  final String? difficulty;
  final String? description;
  final String? benefits;
  @JsonKey(name: 'is_featured')
  final int? isFeatured;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<Category>? categories;

  const Datum({
    this.id,
    this.coachId,
    this.title,
    this.photo,
    this.duration,
    this.difficulty,
    this.description,
    this.benefits,
    this.isFeatured,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.categories,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      coachId,
      title,
      photo,
      duration,
      difficulty,
      description,
      benefits,
      isFeatured,
      status,
      createdAt,
      updatedAt,
      categories,
    ];
  }
}
