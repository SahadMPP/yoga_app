import 'dart:developer';

import 'package:divyog/model/feautured_programs/feautured_programs.dart';
import 'package:divyog/model/home_banners/home_banners.dart';
import 'package:divyog/model/home_slider/home_slider.dart';
import 'package:divyog/services/remote/home/service_feautered_programs.dart';
import 'package:divyog/services/remote/home/service_homebanner.dart';
import 'package:divyog/services/remote/home/service_homeslider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ServicesHomebanner _apiServiceServicesHomebanner = ServicesHomebanner();
  final ServicesHomeslider _apiServiceServicesHomeslider = ServicesHomeslider();
  final ServiceFeauteredPrograms _apiserviceFeauteredPrograms =
      ServiceFeauteredPrograms();

  var homeBanners = const HomeBanners().obs;
  var homeslider = const HomeSlider().obs;
  var featuredPrograms = const FeauturedPrograms().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomeSliders();
    fetchHomeBanners();
    fetchfeauturedPrograms();
  }

//================================ F E T C H H O M E B A N N E R S ================================
  Future<void> fetchHomeBanners() async {
    try {
      /// It sets the loading state to true before making the request and sets it back to false in the finally block.

      isLoading(true);

      /// This function makes an asynchronous request to fetch home banners from the API service.
      final banners = await _apiServiceServicesHomebanner.fetchHomeBanners();

      homeBanners.value = banners;
    } catch (e) {
      log('Error fetching home banners: $e');
    } finally {
      isLoading(false);
    }
  }
//================================ F E T C H H O M E S L I D E R ================================

  Future<void> fetchHomeSliders() async {
    try {
      /// It sets the loading state to true before making the request and sets it back to false in the finally block.

      isLoading(true);

      /// This function makes an asynchronous request to fetch home banners from the API service.
      final sliders = await _apiServiceServicesHomeslider.fetchHomeSliders();

      homeslider.value = sliders;
    } catch (e) {
      log('Error fetching featuredPrograms: $e');
    } finally {
      isLoading(false);
    }
  }
//================================ F E T C H F E A U T E R E D P R O G R A M S ================================

  Future<void> fetchfeauturedPrograms() async {
    try {
      /// It sets the loading state to true before making the request and sets it back to false in the finally block.

      isLoading(true);

      /// This function makes an asynchronous request to fetch feauturedPrograms from the API service.
      final data = await _apiserviceFeauteredPrograms.fetchFeaturedPrograms();

      featuredPrograms.value = data;
    } catch (e) {
      log('Error fetching  featuredPrograms: $e');
    } finally {
      isLoading(false);
    }
  }
}
