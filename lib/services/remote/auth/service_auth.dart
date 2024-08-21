import 'dart:convert';
import 'package:divyog/model/login_model/login_model.dart';
import 'package:divyog/model/otp_verification_model.dart';
import 'package:divyog/utils/secure/secure_storage.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:divyog/utils/log/logger.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final SecureStorage _secureStorage = SecureStorage();

  Future<LoginModel?> sendOtp(String phoneNumber) async {
    try {
      final body = json.encode({'mobile_number': phoneNumber});
      final response = await http.post(
        Uri.parse('${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.auth}'),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      LogHelper.v(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final loginModel = LoginModel.fromJson(jsonResponse);

        // Extract the token from the response, adjust the key based on your API's response structure.
        final accessToken = jsonResponse['access_token'];

        if (accessToken != null) {
          await _secureStorage.storeToken(accessToken);
        }

        return loginModel;
      } else {
        final errorResponse = json.decode(response.body);
        final errorMessage = errorResponse['message'] ?? 'An error occurred';
        LogHelper.v(errorMessage);
        return null;
      }
    } catch (e) {
      LogHelper.v('An error occurred: $e');
      return null;
    }
  }

  Future<OtpVerificationModel?> verifyOtp(String otp) async {
    try {
      final accessToken = await _secureStorage.getToken();

      final response = await http.post(
        Uri.parse('${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.verifyOtp}'),
        body: json.encode({'otp': otp}),
        headers: {
          'Content-Type': 'application/json',
          if (accessToken != null) 'Authorization': 'Bearer $accessToken',
        },
      );

      LogHelper.i(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return OtpVerificationModel.fromJson(jsonResponse);
      } else {
        LogHelper.v('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      LogHelper.v('An error occurred: $e');
      return null;
    }
  }
}
