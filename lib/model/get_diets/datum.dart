import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'diet.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  final int? id;
  final String? name;
  final String? photo;
  final int? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<Diet>? diets;

  const Datum({
    this.id,
    this.name,
    this.photo,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.diets,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      photo,
      status,
      createdAt,
      updatedAt,
      diets,
    ];
  }
}
