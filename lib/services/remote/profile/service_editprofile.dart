import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:divyog/model/edit_profile/edit_profile.dart';
import 'package:divyog/utils/secure/secure_storage.dart';
import 'package:divyog/utils/url/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class EditProfileService {
  final SecureStorage storage = SecureStorage();

  Future<EditProfile> editProfile({
    File? photo, // Nullable File for the selected image
    required String height,
    required String weight,
    required String name,
    required String bio,
  }) async {
    try {
      // Retrieve the stored token
      final token = await storage.getToken();
      if (token == null) {
        throw Exception('Authorization token not found');
      }

      // Prepare the request URL
      final url = Uri.parse(
        '${ConstantDivyogUrl.baseUrl}${ConstantDivyogUrl.editProfile}',
      );

      // Create a multipart request
      final request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token';

      // Add the text fields
      request.fields['height'] = height;
      request.fields['weight'] = weight;
      request.fields['name'] = name;
      request.fields['bio'] = bio;

      // Only add the image file if a new image is selected
      if (photo != null) {
        // Check if the file exists
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
      }

      // Send the request and get the response
      final response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        log(responseData);
        log(response.statusCode.toString());
        return EditProfile.fromJson(jsonDecode(responseData));
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
