import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
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

  const Datum({
    this.id,
    this.name,
    this.photo,
    this.parentCategoryId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

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
    ];
  }
}
