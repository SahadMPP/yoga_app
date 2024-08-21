import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'feautured_programs.g.dart';

@JsonSerializable()
class FeauturedPrograms extends Equatable {
  final bool? success;
  final List<Datum>? data;

  const FeauturedPrograms({this.success, this.data});

  factory FeauturedPrograms.fromJson(Map<String, dynamic> json) {
    return _$FeauturedProgramsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$FeauturedProgramsToJson(this);

  @override
  List<Object?> get props => [success, data];
}
