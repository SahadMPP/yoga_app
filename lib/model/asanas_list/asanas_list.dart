import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'asanas_list.g.dart';

@JsonSerializable()
class AsanasList extends Equatable {
  final bool? success;
  final Data? data;

  const AsanasList({this.success, this.data});

  factory AsanasList.fromJson(Map<String, dynamic> json) {
    return _$AsanasListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AsanasListToJson(this);

  @override
  List<Object?> get props => [success, data];
}
