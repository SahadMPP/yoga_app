import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_details.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final dynamic photo;
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  final String? otp;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @JsonKey(name: 'is_admin')
  final int? isAdmin;
  final int? active;
  final String? token;
  @JsonKey(name: 'connction_id')
  final dynamic connctionId;
  @JsonKey(name: 'user_status')
  final String? userStatus;
  @JsonKey(name: 'user_details')
  final UserDetails? userDetails;

  const Data({
    this.id,
    this.name,
    this.email,
    this.photo,
    this.mobileNumber,
    this.emailVerifiedAt,
    this.otp,
    this.createdAt,
    this.updatedAt,
    this.isAdmin,
    this.active,
    this.token,
    this.connctionId,
    this.userStatus,
    this.userDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      photo,
      mobileNumber,
      emailVerifiedAt,
      otp,
      createdAt,
      updatedAt,
      isAdmin,
      active,
      token,
      connctionId,
      userStatus,
      userDetails,
    ];
  }
}
