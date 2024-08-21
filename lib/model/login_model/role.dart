import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'pivot.dart';

part 'role.g.dart';

@JsonSerializable()
class Role extends Equatable {
  final int? id;
  final String? name;
  @JsonKey(name: 'guard_name')
  final String? guardName;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Pivot? pivot;

  const Role({
    this.id,
    this.name,
    this.guardName,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      guardName,
      createdAt,
      updatedAt,
      pivot,
    ];
  }
}
