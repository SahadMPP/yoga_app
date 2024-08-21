import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:divyog/model/complete_profile/complete_profile/complete_profile.dart';
import 'package:divyog/utils/helper/login_helper.dart';
import 'package:divyog/utils/secure/secure_storage.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:divyog/views/priseplans/widgets/priceplan_copy.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class CompleteProfileService {
  final SecureStorage storage = SecureStorage();

  Future<CompleteProfile> fetchCompleteProfile({
    required File photo,
    required String dob,
    required String height,
    required String weight,
    required String gender,
    required List<String> selectedCategories,
    required List<String> diseases,
    required String location,
    required String bio,
    required List<String> dietPreferences,
  }) async {
    try {
      // Retrieve the stored token
      final token = await storage.getToken();
      if (token == null) {
        throw Exception('Authorization token not found');
      }

      // Prepare the request URL
      final url = Uri.parse(
        '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.completeProfile}',
      );

      // Create a multipart request
      final request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token';

      // Add the text fields
      request.fields['dob'] = dob;
      request.fields['height'] = height;
      request.fields['weight'] = weight;
      request.fields['gender'] = gender;
      request.fields['goals'] = jsonEncode(selectedCategories);
      request.fields['location'] = location;
      request.fields['diet_preference'] = jsonEncode(dietPreferences);
      request.fields['diseases'] = jsonEncode(diseases);
      request.fields['bio'] = bio;

      // Add the image file with content type
      if (photo.existsSync()) {
        final mimeTypeData = lookupMimeType(photo.path)?.split('/');
        if (mimeTypeData != null && mimeTypeData.length == 2) {
          request.files.add(await http.MultipartFile.fromPath(
            'photo',
            photo.path,
            contentType: MediaType(mimeTypeData[0], mimeTypeData[1]),
          ));
        } else {
          throw Exception('Invalid mime type for the provided photo');
        }
      } else {
        throw Exception('Photo file not found');
      }

      // Send the request and get the response
      final response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        log(responseData);
        log(response.statusCode.toString());

        Get.snackbar("Success", "Profile submitted successfully");
        Get.offAll(() => const MyPlansScreenWithSkip());
        LoginHelper.saveUserLoggedInStatus(true);

        return CompleteProfile.fromJson(jsonDecode(responseData));
      } else {
        final errorResponse = await response.stream.bytesToString();
        throw Exception('Failed to submit profile: $errorResponse');
      }
    } catch (e) {
      log('Error submitting profile: $e');
      throw Exception('An error occurred while submitting the profile: $e');
    }
  }
}
