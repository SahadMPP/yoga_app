import 'dart:convert';
import 'package:divyog/model/asanas_category/asanas_category.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServicesAsanasCategory {
  Future<AsanasCategory> fetchAsanasCategory() async {
    try {
      final response = await http.get(Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.asanascategory}'));

      if (response.statusCode == 200) {
        return AsanasCategory.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch Asanas Category');
      }
    } catch (e) {
      throw Exception('Failed to fetch Asanas Category $e');
    }
  }
}
