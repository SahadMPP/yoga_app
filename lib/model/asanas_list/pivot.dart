import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot extends Equatable {
  @JsonKey(name: 'asanas_category_id')
  final int? asanasCategoryId;
  @JsonKey(name: 'asana_id')
  final int? asanaId;

  const Pivot({this.asanasCategoryId, this.asanaId});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);

  @override
  List<Object?> get props => [asanasCategoryId, asanaId];
}
