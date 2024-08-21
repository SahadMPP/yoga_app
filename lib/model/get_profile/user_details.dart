import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails extends Equatable {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? photo;
  final String? weight;
  final String? height;
  final String? gender;
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final List<String>? goals;
  final List<String>? diseases;
  final String? location;
  final String? bio;
  @JsonKey(name: 'diet_preference')
  final List<String>? dietPreference;

  const UserDetails({
    this.id,
    this.userId,
    this.photo,
    this.weight,
    this.height,
    this.gender,
    this.dateOfBirth,
    this.createdAt,
    this.updatedAt,
    this.goals,
    this.diseases,
    this.location,
    this.bio,
    this.dietPreference,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return _$UserDetailsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      photo,
      weight,
      height,
      gender,
      dateOfBirth,
      createdAt,
      updatedAt,
      goals,
      diseases,
      location,
      bio,
      dietPreference,
    ];
  }
}
