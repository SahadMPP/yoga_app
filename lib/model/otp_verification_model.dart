import 'package:equatable/equatable.dart';

class OtpVerificationModel extends Equatable {
  final bool? success;
  final String? message;

  const OtpVerificationModel({this.success, this.message});

  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) {
    return OtpVerificationModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
      };

  @override
  List<Object?> get props => [success, message];
}
