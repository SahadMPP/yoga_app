import 'package:divyog/controller/home/home_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomescreenSecondBanner extends StatelessWidget {
  final HomeController controller;
  const HomescreenSecondBanner({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: sOrange,
          ),
        );
      } else if (controller.homeBanners.value.data == null ||
          controller.homeBanners.value.data!.isEmpty) {
        return const Center(child: Text('No banners found'));
      } else {
        return Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                      controller.homeBanners.value.data!.first.photo ?? ''),
                  fit: BoxFit.cover)),
        );
      }
    });
  }
}
