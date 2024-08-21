import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final bool? success;
  @JsonKey(name: 'access_token')
  final String? accessToken;
  final User? user;

  const LoginModel({this.success, this.accessToken, this.user});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object?> get props => [success, accessToken, user];
}
