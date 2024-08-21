import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DownloadController extends GetxController {
  /// Downloads a video from the given [url] and saves it with the specified [fileName] in the application's documents directory.
  ///
  /// Throws a [DioException] if the download fails.
  ///
  /// Returns a [Future] that completes when the download is finished.
  Future<void> downloadVideo(String url, String fileName) async {
    Dio dio = Dio();
    try {
      var dir = await getApplicationDocumentsDirectory();
      String savePath = "${dir.path}/$fileName";
// eda
      log("Downloading video from $url to $savePath");
      await dio.download(url, savePath);
      log("Download completed! File saved at: $savePath");

      File file = File(savePath);
      if (await file.exists()) {
        Get.snackbar("Exist", "Already Downloaded");
      } else {
        Get.snackbar("Success", "Downloaded Successfully");
      }
    } catch (e) {
      print("Error during download: $e");
      Get.snackbar("Error", "Failed to download: $e");
    }
  }
}
