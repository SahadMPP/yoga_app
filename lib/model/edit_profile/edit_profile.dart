import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_profile.g.dart';

@JsonSerializable()
class EditProfile extends Equatable {
  final bool? success;
  final String? message;

  const EditProfile({this.success, this.message});

  factory EditProfile.fromJson(Map<String, dynamic> json) {
    return _$EditProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EditProfileToJson(this);

  @override
  List<Object?> get props => [success, message];
}
