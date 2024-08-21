import 'dart:developer';
import 'dart:io';

import 'package:divyog/model/complete_profile/complete_profile/complete_profile.dart';
import 'package:divyog/services/remote/completeprofile/service_complete_profile.dart';
import 'package:get/get.dart';
import 'package:divyog/services/remote/completeprofile/service_completeprofile_categories.dart';
import 'package:divyog/model/complete_profile_categories/complete_profile_categories.dart';

class CompleteProfileController extends GetxController {
  final CompleteProfileCategoryService
      _apiserviceServicesCompleteProfileCategory =
      CompleteProfileCategoryService();
  final CompleteProfileService _service = CompleteProfileService();
  final completeProfile = const CompleteProfile().obs;
  var errorMessage = ''.obs;
  var submitisLoading = false.obs;

  var completeProfileCategory = const CompleteProfileCategories().obs;
  var isLoading = true.obs;
  var selectedCategories = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCompleteProfileCategory();
  }

  Future<void> fetchCompleteProfileCategory() async {
    try {
      isLoading(true);
      final categories = await _apiserviceServicesCompleteProfileCategory
          .fetchCompleteProfileCategory();
      completeProfileCategory.value = categories;
    } catch (e) {
      print('Error fetching complete profile categories: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> submitCompleteProfile({
    required File photo,
    required String dob,
    required String height,
    required String weight,
    required String gender,
    required List<String> selectedCategories,
    required List<String> diseases,
    required String location,
    required String bio,
    required List<String> dietPreferences,
  }) async {
    submitisLoading.value = true;
    try {
      final result = await _service.fetchCompleteProfile(
        photo: photo,
        dob: dob,
        height: height,
        weight: weight,
        gender: gender,
        selectedCategories: selectedCategories,
        diseases: diseases,
        location: location,
        bio: bio,
        dietPreferences: dietPreferences,
      );
      completeProfile.value = result;
      log(completeProfile.value.toString());
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
      Get.snackbar("Error", "$e");
    } finally {
      submitisLoading.value = false;
    }
  }
}
