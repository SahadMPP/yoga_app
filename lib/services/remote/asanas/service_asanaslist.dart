import 'dart:convert';
import 'package:divyog/model/asanas_list/asanas_list.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServiceAsanaslist {
  Future<AsanasList> fetchAsanasList(int categoryId) async {
    try {
      final body = json.encode({'cat_id': categoryId});
      final response = await http.post(
        Uri.parse(
            '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.asanasByCategory}'),
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return AsanasList.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Asanas List');
      }
    } catch (e) {
      throw Exception('Failed $e');
    }
  }
}
