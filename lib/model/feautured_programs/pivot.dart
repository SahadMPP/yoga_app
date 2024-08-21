import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pivot.g.dart';

@JsonSerializable()
class Pivot extends Equatable {
  @JsonKey(name: 'program_id')
  final int? programId;
  @JsonKey(name: 'category_id')
  final int? categoryId;

  const Pivot({this.programId, this.categoryId});

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);

  @override
  List<Object?> get props => [programId, categoryId];
}
