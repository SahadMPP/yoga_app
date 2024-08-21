import 'dart:convert';
import 'package:divyog/model/get_diets/get_diets.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServiceDiets {
  Future<GetDiets> fetchDiets() async {
    try {
      final response = await http.get(
          Uri.parse('${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.diets}'));

      if (response.statusCode == 200) {
        return GetDiets.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to fetch Diets');
      }
    } catch (e) {
      throw Exception('Failed to fetch Diets: $e');
    }
  }
}
