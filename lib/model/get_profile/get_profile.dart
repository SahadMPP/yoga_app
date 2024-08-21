import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_profile.g.dart';

@JsonSerializable()
class GetProfile extends Equatable {
  final bool? success;
  final Data? data;

  const GetProfile({this.success, this.data});

  factory GetProfile.fromJson(Map<String, dynamic> json) {
    return _$GetProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetProfileToJson(this);

  @override
  List<Object?> get props => [success, data];
}
