import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pivot.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  final int? id;
  final String? name;
  final String? photo;
  @JsonKey(name: 'parent_category_id')
  final int? parentCategoryId;
  final int? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Pivot? pivot;

  const Category({
    this.id,
    this.name,
    this.photo,
    this.parentCategoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      photo,
      parentCategoryId,
      status,
      createdAt,
      updatedAt,
      pivot,
    ];
  }
}
