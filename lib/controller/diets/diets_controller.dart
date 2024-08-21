import 'dart:developer'; // Importing dart:developer for logging purposes.

import 'package:divyog/model/get_diets/get_diets.dart';
import 'package:divyog/services/remote/diets/service_diets.dart';
import 'package:get/get.dart'; // Importing GetX library for state management.

class DietsController extends GetxController {
  final ServiceDiets _apiserviceServiceDiets = ServiceDiets();

  var diets = const GetDiets().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    // Call the fetchDiets method when the controller is initialized.
    fetchDiets();
  }

  /// Function to fetch the list of diets based on an ID.
  Future<void> fetchDiets() async {
    try {
      // Setting isLoading to true to indicate loading state.
      isLoading(true);

      // Making an asynchronous API request to fetch the list of diets.
      final data = await _apiserviceServiceDiets.fetchDiets();

      // Updating the value of diets with the fetched data.
      diets.value = data;
    } catch (e) {
      // Logging an error message if there's an exception during the API call.
      log('Error fetching diets: $e');
    } finally {
      // Setting isLoading back to false after the API call completes (whether successful or not).
      isLoading(false);
    }
  }

  // Add other commands here if needed.
}
