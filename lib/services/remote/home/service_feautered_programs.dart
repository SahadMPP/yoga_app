import 'dart:convert';
import 'dart:developer';
import 'package:divyog/model/feautured_programs/feautured_programs.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServiceFeauteredPrograms {
  Future<FeauturedPrograms> fetchFeaturedPrograms() async {
    try {
      final response = await http.get(Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.featuredprograms}'));

      if (response.statusCode == 200) {
        return FeauturedPrograms.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load home banners');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch home banners');
    }
  }
}
