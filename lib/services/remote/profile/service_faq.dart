import 'dart:convert';
import 'dart:developer';
import 'package:divyog/model/faq/faq.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;

class ServicesFaq {
  Future<Faq> fetchFaq() async {
    try {
      final response = await http.get(
        Uri.parse(
          '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.faq}',
        ),
      );

      if (response.statusCode == 200) {
        return Faq.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load Faq');
      }
    } catch (e) {
      log('Error fetching Faq: $e');
      throw Exception('Failed to fetch Faq');
    }
  }
}
