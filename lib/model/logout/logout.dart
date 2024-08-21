import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'logout.g.dart';

@JsonSerializable()
class Logout extends Equatable {
  final String? message;

  const Logout({this.message});

  factory Logout.fromJson(Map<String, dynamic> json) {
    return _$LogoutFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LogoutToJson(this);

  @override
  List<Object?> get props => [message];
}
