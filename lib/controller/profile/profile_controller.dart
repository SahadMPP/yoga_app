import 'dart:developer';
import 'dart:io';

import 'package:divyog/model/edit_profile/edit_profile.dart';
import 'package:divyog/model/faq/faq.dart';
import 'package:divyog/model/get_profile/get_profile.dart';
import 'package:divyog/model/logout/logout.dart';
import 'package:divyog/services/remote/logout/service_logout.dart';
import 'package:divyog/services/remote/profile/service_editprofile.dart';
import 'package:divyog/services/remote/profile/service_faq.dart';
import 'package:divyog/services/remote/profile/service_profile.dart';
import 'package:get/get.dart'; // Importing GetX library for state management.

/// Controller class for managing the profile functionality.
class ProfileController extends GetxController {
  // Creating an instance of the Getservice class.
  final ServicesProfile _apiserviceServicesProfile = ServicesProfile();

  // Creating an instance of the Logoutservice class.
  final ServicesLogout _apiserviceServiceLogout = ServicesLogout();

  // Creating an instance of the EditprofileService class.
  final EditProfileService _apiserviceEditProfile = EditProfileService();

  // Creating an instance of the FaqService class.
  final ServicesFaq _apiServiceFaq = ServicesFaq();

  // Observable variable to hold the faq data.
  var faq = const Faq().obs;

  /// Observable variable to hold the logout data.
  var logout = const Logout().obs;

  // Observable variable to hold the profile data.
  var profile = const GetProfile().obs;

  // Observable variable to hold the Editprofile data.
  var edit = const EditProfile().obs;

  // Observable variable to manage loading state.
  var isLoading = true.obs;

  /// Observable variable to manage loading state.
  var isLogoutLoading = true.obs;

  /// Observable variable to manage loading state.
  var isEditingisLoading = true.obs;

  /// Observable variable to manage loading state.
  var isFaqLoading = true.obs;

  /// Observable variable to hold the expanded index.
  var expandedIndex = (-1).obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfile(); // Fetching the profile data when the controller is initialized.
    fetchFaq(); // Fetching the faq data when the controller is initialized.
  }

  /// Function to fetch the profile data.
  ///
  /// This function makes an asynchronous API request to fetch the profile data
  /// and updates the [profile] variable with the fetched data.
  Future<void> fetchProfile() async {
    try {
      // Setting isLoading to true to indicate loading state.
      isLoading(true);

      // Making an asynchronous API request to fetch the profile data.
      final data = await _apiserviceServicesProfile.fetchProfile();

      // Updating the value of profile with the fetched data.
      profile.value = data;
    } catch (e) {
      // Logging an error message if there's an exception during the API call.
      log('Error fetching profile data: $e');
    } finally {
      // Setting isLoading back to false after the API call completes (whether successful or not).
      isLoading(false);
    }
  }

  /// Function to fetch the logout data.
  ///
  /// This function makes an asynchronous API request to fetch the logout data
  /// and updates the [logout](cci:1:///Users/ayoob/Documents/GreenCreon/divyog/lib/services/remote/logout/service_logout.dart:10:2-30:3) variable with the fetched data.
  Future<void> fetchlogout() async {
    try {
      // Setting `isLoading` to true to indicate loading state.
      isLogoutLoading(true);

      // Making an asynchronous API request to fetch the logout data.
      final data = await _apiserviceServiceLogout.fetchlogout();

      // Updating the value of [logout](cci:1:///Users/ayoob/Documents/GreenCreon/divyog/lib/services/remote/logout/service_logout.dart:10:2-30:3) with the fetched data.
      logout.value = data;
    } catch (e) {
      // Logging an error message if there's an exception during the API call.
      log('Error fetching logout data: $e');
    } finally {
      // Setting `isLoading` back to false after the API call completes (whether successful or not).
      isLogoutLoading(false);
    }
  }

  /// Edits the user profile with the provided information.
  ///
  /// Parameters:
  ///   - `photo`: The profile photo to be updated.
  ///   - `bio`: The user's bio to be updated.
  ///   - `height`: The user's height to be updated.
  ///   - `weight`: The user's weight to be updated.
  ///   - `name`: The user's name to be updated.
  ///
  /// Returns:
  ///   - A `Future<void>` that completes when the profile is successfully edited.
  ///
  /// Throws:
  ///   - An exception if there is an error during the API call.
  Future<void> editProfile({
    File? photo,
    required String bio,
    required String height,
    required String weight,
    required String name,
  }) async {
    try {
      // Setting `isLoading` to true to indicate loading state.
      isLogoutLoading(true);

      // Making an asynchronous API request to fetch the logout data.
      final data = await _apiserviceEditProfile.editProfile(
        bio: bio,
        height: height,
        name: name,
        photo: photo,
        weight: weight,
      );

      // Updating the value of [edit] with the fetched data.
      edit.value = data;
    } catch (e) {
      // Logging an error message if there's an exception during the API call.
      log('Error fetching edit data: $e');
    } finally {
      // Setting `isLoading` back to false after the API call completes (whether successful or not).
      isLogoutLoading(false);
    }
  }

  /// Fetches the FAQ data from the API.
  ///
  /// Returns:
  ///   - A `Future<void>` that completes when the FAQ data is successfully fetched.
  ///
  /// Throws:
  ///   - An exception if there is an error during the API call.
  Future<void> fetchFaq() async {
    try {
      // Setting `isLoading` to true to indicate loading state.
      isLogoutLoading(true);

      // Making an asynchronous API request to fetch the FAQ data.
      final data = await _apiServiceFaq.fetchFaq();

      // Updating the value of [faq] with the fetched data.
      faq.value = data;
    } catch (e) {
      // Logging an error message if there's an exception during the API call.
      log('Error fetching FAQ data: $e');
    } finally {
      // Setting `isLoading` back to false after the API call completes (whether successful or not).
      isLogoutLoading(false);
    }
  }

  void toggleExpansion(int index) {
    if (expandedIndex.value == index) {
      expandedIndex.value = -1;
    } else {
      expandedIndex.value = index;
    }
  }

  //======== R e b u i l d =========>
  var appState = 0.obs;

  void rebuildApp() {
    appState.value++;
  }
}
