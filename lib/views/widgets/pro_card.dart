import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/priseplans/screen_prise_plan.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ProCard extends StatelessWidget {
  const ProCard({
    super.key,
  });

  @override
  // Builds the widget for the ProCard with a Container containing an image.
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MyPlansScreen());
      },
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage(
                  'assets/2.png',
                ),
                fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(color: sOrange, spreadRadius: 1, blurRadius: 1)
            ]),
      ),
    );
  }
}
