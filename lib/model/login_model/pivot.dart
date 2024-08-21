import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot extends Equatable {
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'role_id')
  final int? roleId;

  const Pivot({this.userId, this.roleId});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);

  @override
  List<Object?> get props => [userId, roleId];
}
