import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'asanas_category.g.dart';

@JsonSerializable()
class AsanasCategory extends Equatable {
  final bool? success;
  final Map<String, Datum>? data;

  const AsanasCategory({this.success, this.data});

  factory AsanasCategory.fromJson(Map<String, dynamic> json) =>
      _$AsanasCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$AsanasCategoryToJson(this);

  @override
  List<Object?> get props => [success, data];
}
