import 'dart:convert';
import 'package:divyog/model/complete_profile_categories/complete_profile_categories.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class CompleteProfileCategoryService {
  Future<CompleteProfileCategories> fetchCompleteProfileCategory() async {
    try {
      final response = await http.get(Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.completeProfileCategories}'));

      if (response.statusCode == 200) {
        return CompleteProfileCategories.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load complete profile categories');
      }
    } catch (e) {
      throw Exception('Failed complete Profile $e');
    }
  }
}
