import 'dart:convert';
import 'package:divyog/model/user_registration/user_registration.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/log/logger.dart';
import 'package:divyog/views/completeprofile/complete_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserRegistrationController extends GetxController {
  final _secureStorage = const FlutterSecureStorage();
  final Rxn<UserRegistration> _userRegistration = Rxn<UserRegistration>();

  UserRegistration? get userRegistration => _userRegistration.value;

  Future<bool> registerUser({
    required String phoneNumber,
    required String email,
    required String name,
  }) async {
    try {
      final body = json.encode({
        'mobile_number': phoneNumber,
        'email': email,
        'name': name,
      });

      final response = await http.post(
        Uri.parse('${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.register}'),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      LogHelper.i(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        _userRegistration.value = UserRegistration.fromJson(jsonResponse);

        await _secureStorage.write(
          key: 'access_token',
          value: _userRegistration.value?.accessToken,
        );

        Get.snackbar(
          "Success",
          'Registration successful',
          backgroundColor: Colors.white,
          backgroundGradient: LinearGradient(colors: [sOrange100, sOrange]),
          snackPosition: SnackPosition.TOP,
        );
        Get.to(() => const CompleteProfile());

        return true;
      } else {
        final errorResponse = json.decode(response.body);
        final errorMessage = errorResponse['message'] ?? 'An error occurred';

        Get.snackbar(
          errorMessage,
          '',
          backgroundColor: Colors.white,
          backgroundGradient: LinearGradient(
            colors: [Colors.red.shade300, Colors.red.shade100],
          ),
          snackPosition: SnackPosition.TOP,
        );

        return false;
      }
    } catch (e) {
      LogHelper.v('An error occurred: $e');
      return false;
    }
  }
}
