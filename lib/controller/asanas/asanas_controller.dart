import 'dart:developer';

import 'package:divyog/model/asanas_category/asanas_category.dart';
import 'package:divyog/services/remote/asanas/service_asanacategory.dart';
import 'package:get/get.dart';

class AsanasCategoryController extends GetxController {
  final ServicesAsanasCategory _apiServiceServicesAsanasCategory =
      ServicesAsanasCategory();

  var asanasCategory = const AsanasCategory().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAsanasCategory();
  }

  /// Fetches the asanas category from the API service.
  ///
  /// This function makes an asynchronous request to fetch the asanas category from the API service.
  /// It sets the loading state to true before making the request and sets it back to false in the finally block.
  /// If the request is successful, the fetched category is assigned to the `asanasCategory` variable.
  /// If there is an error, the error message is logged.
  ///
  /// Returns a `Future<void>` indicating the completion of the function.
  Future<void> fetchAsanasCategory() async {
    try {
      /// It sets the loading state to true before making the request and sets it back to false in the finally block.

      isLoading(true);

      /// This function makes an asynchronous request to fetch home banners from the API service.
      final category =
          await _apiServiceServicesAsanasCategory.fetchAsanasCategory();

      asanasCategory.value = category;
    } catch (e) {
      log('Error fetching home banners: $e');
    } finally {
      isLoading(false);
    }
  }
}
