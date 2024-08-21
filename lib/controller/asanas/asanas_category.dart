import 'dart:developer'; // Importing dart:developer for logging purposes.

import 'package:divyog/model/asanas_list/asanas_list.dart'; // Importing the AsanasList model.
import 'package:divyog/services/remote/asanas/service_asanaslist.dart'; // Importing the service class for fetching asanas.
import 'package:get/get.dart'; // Importing GetX library for state management.

class AsanasListController extends GetxController {
  final ServiceAsanaslist _apiserviceServicesAsanasList =
      ServiceAsanaslist(); // Creating an instance of the service class.

  var asanasList =
      const AsanasList().obs; // Observable variable to hold the list of asanas.
  var isLoading = true.obs; // Observable variable to manage loading state.

  /// Function to fetch the list of asanas based on an ID.
  Future<void> fetchAsanasList(int id) async {
    try {
      // Setting isLoading to true to indicate loading state.
      isLoading(true);

      // Making an asynchronous API request to fetch the list of asanas.
      final asanas = await _apiserviceServicesAsanasList.fetchAsanasList(id);

      // Updating the value of asanasList with the fetched data.
      asanasList.value = asanas;
    } catch (e) {
      // Logging an error message if there's an exception during the API call.
      log('Error fetching asanas list: $e');
    } finally {
      // Setting isLoading back to false after the API call completes (whether successful or not).
      isLoading(false);
    }
  }
}
