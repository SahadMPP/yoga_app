import 'package:divyog/services/remote/auth/service_auth.dart';
import 'package:divyog/utils/helper/login_helper.dart';
import 'package:get/get.dart';
import 'package:divyog/model/login_model/login_model.dart';
import 'package:divyog/model/otp_verification_model.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/bottomnavigation/bottom_navigation.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  var loginSuccess = false.obs;

  final AuthService _authService = AuthService();
  final Rxn<LoginModel> _loginModel = Rxn<LoginModel>();
  final Rxn<OtpVerificationModel> _otpVerificationModel =
      Rxn<OtpVerificationModel>();

  LoginModel? get loginModel => _loginModel.value;
  OtpVerificationModel? get otpVerificationModel => _otpVerificationModel.value;

  Future<bool> sendOtp(String phoneNumber) async {
    final loginModel = await _authService.sendOtp(phoneNumber);

    if (loginModel != null) {
      _loginModel.value = loginModel;

      Get.snackbar(
        "Success",
        'OTP sent successfully',
        backgroundColor: Colors.white,
        backgroundGradient: LinearGradient(colors: [sOrange100, sOrange]),
        snackPosition: SnackPosition.TOP,
      );

      return true;
    } else {
      Get.snackbar(
        "Error",
        'Failed to send OTP',
        backgroundColor: Colors.white,
        backgroundGradient:
            LinearGradient(colors: [Colors.red.shade300, Colors.red.shade100]),
        snackPosition: SnackPosition.TOP,
      );

      return false;
    }
  }

  Future<void> verifyOtp(String otp) async {
    final otpVerificationModel = await _authService.verifyOtp(otp);

    if (otpVerificationModel != null && otpVerificationModel.success == true) {
      _otpVerificationModel.value = otpVerificationModel;

      Get.offAll(() => const BottomNavBar());
      Get.snackbar(
        "Success",
        'OTP Verified successfully',
        backgroundColor: Colors.white,
        backgroundGradient: LinearGradient(colors: [sOrange100, sOrange]),
        snackPosition: SnackPosition.TOP,
      );
      LoginHelper.saveUserLoggedInStatus(true);
    } else {
      Get.snackbar(
        "Error",
        'OTP verification failed',
        backgroundColor: Colors.white,
        backgroundGradient:
            LinearGradient(colors: [Colors.red.shade300, Colors.red.shade100]),
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
