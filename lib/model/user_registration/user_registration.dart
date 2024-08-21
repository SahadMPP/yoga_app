import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'user_registration.g.dart';

@JsonSerializable()
class UserRegistration extends Equatable {
  final bool? success;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  final User? user;

  const UserRegistration({this.success, this.accessToken, this.user});

  factory UserRegistration.fromJson(Map<String, dynamic> json) {
    return _$UserRegistrationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserRegistrationToJson(this);

  @override
  List<Object?> get props => [success, accessToken, user];
}
