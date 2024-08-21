import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complete_profile.g.dart';

@JsonSerializable()
class CompleteProfile extends Equatable {
  final bool? success;
  final String? message;

  const CompleteProfile({this.success, this.message});

  factory CompleteProfile.fromJson(Map<String, dynamic> json) {
    return _$CompleteProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CompleteProfileToJson(this);

  @override
  List<Object?> get props => [success, message];
}
