import 'dart:async';

import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/helper/login_helper.dart';
import 'package:divyog/views/bottomnavigation/bottom_navigation.dart';
import 'package:divyog/views/login/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  //LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    getUserLoggedInStatus();
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (_isSignedIn) {
        Get.offAll(const BottomNavBar());
      } else {
        Get.offAll(const LoginPage());
      }
    });
  }

  bool _isSignedIn = false;

  getUserLoggedInStatus() async {
    await LoginHelper.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: sWhite),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset(
                        'assets/DIVYOG-01-01-01.jpg',
                        height: 250,
                        width: 250,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Positioned(
              bottom: 30, // Adjust the value as needed
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      ' GreenCreon',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
