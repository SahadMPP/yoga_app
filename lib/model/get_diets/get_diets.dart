import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_diets.g.dart';

@JsonSerializable()
class GetDiets extends Equatable {
  final bool? success;
  final List<Datum>? data;

  const GetDiets({this.success, this.data});

  factory GetDiets.fromJson(Map<String, dynamic> json) {
    return _$GetDietsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetDietsToJson(this);

  @override
  List<Object?> get props => [success, data];
}
