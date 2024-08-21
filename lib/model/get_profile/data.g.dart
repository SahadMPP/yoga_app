// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      photo: json['photo'],
      mobileNumber: json['mobile_number'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      otp: json['otp'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isAdmin: (json['is_admin'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      token: json['token'] as String?,
      connctionId: json['connction_id'],
      userStatus: json['user_status'] as String?,
      userDetails: json['user_details'] == null
          ? null
          : UserDetails.fromJson(json['user_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'mobile_number': instance.mobileNumber,
      'email_verified_at': instance.emailVerifiedAt,
      'otp': instance.otp,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_admin': instance.isAdmin,
      'active': instance.active,
      'token': instance.token,
      'connction_id': instance.connctionId,
      'user_status': instance.userStatus,
      'user_details': instance.userDetails,
    };
