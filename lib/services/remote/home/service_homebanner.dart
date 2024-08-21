import 'dart:convert';
import 'dart:developer';
import 'package:divyog/model/home_banners/home_banners.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServicesHomebanner {
  Future<HomeBanners> fetchHomeBanners() async {
    try {
      final response = await http.get(Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.homeBanner}'));

      if (response.statusCode == 200) {
        return HomeBanners.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load home banners');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch home banners');
    }
  }
}
