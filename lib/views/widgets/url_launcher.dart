// ignore_for_file: deprecated_member_use, avoid_print

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

launchWhatsapp(String phoneNumber) async {
  final url =
      'https://api.whatsapp.com/send?phone=$phoneNumber&text=Hello%20from%20my%20app!';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch WhatsApp');
    Get.snackbar("Error", "Could not launch Whatsapp",
        snackPosition: SnackPosition.BOTTOM);
  }
}

void makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);

  // Debugging statements to understand the flow
  print('Attempting to launch $launchUri');

  try {
    if (await canLaunch(launchUri.toString())) {
      print('Launching $launchUri');
      await launch(launchUri.toString());
    } else {
      print('Could not launch $launchUri');
      throw 'Could not launch $launchUri';
    }
  } catch (e) {
    print('Error: $e');
  }
}

void launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
