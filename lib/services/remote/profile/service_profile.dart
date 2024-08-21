import 'dart:convert';
import 'dart:developer';
import 'package:divyog/model/get_profile/get_profile.dart';
import 'package:divyog/utils/secure/secure_storage.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServicesProfile {
  final _secureStorage = SecureStorage();
  Future<GetProfile> fetchProfile() async {
    try {
      final token = await _secureStorage.getToken();
      final response = await http.get(
        Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.profileUrl}',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        },
      );

      if (response.statusCode == 200) {
        return GetProfile.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load profile data');
      }
    } catch (e) {
      log('Error fetching profile: $e');
      throw Exception('Failed to fetch profile data');
    }
  }
}
