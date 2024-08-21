import 'dart:convert';
import 'dart:developer';
import 'package:divyog/model/logout/logout.dart';
import 'package:divyog/utils/secure/secure_storage.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServicesLogout {
  final SecureStorage storage = SecureStorage();

  Future<Logout> fetchlogout() async {
    try {
      final token = await storage.getToken();
      final response = await http.post(
        Uri.parse('${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.logout}'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        return Logout.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to loagout');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to logout $e');
    }
  }
}
