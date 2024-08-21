import 'dart:convert';
import 'dart:developer';
import 'package:divyog/model/home_slider/home_slider.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServicesHomeslider {
  Future<HomeSlider> fetchHomeSliders() async {
    try {
      final response = await http.get(Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.homeSlider}'));

      if (response.statusCode == 200) {
        return HomeSlider.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load home slider');
      }
    } catch (e) {
      log('Error fetching home sliders: $e');
      throw Exception('Failed to fetch home sliders');
    }
  }
}
