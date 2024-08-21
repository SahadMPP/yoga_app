import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'asana.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? photo;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<Asana>? asanas;

  const Data({
    this.id,
    this.name,
    this.status,
    this.photo,
    this.createdAt,
    this.updatedAt,
    this.asanas,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      status,
      photo,
      createdAt,
      updatedAt,
      asanas,
    ];
  }
}
