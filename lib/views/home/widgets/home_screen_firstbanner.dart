import 'package:carousel_slider/carousel_slider.dart';
import 'package:divyog/controller/home/home_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenFirstBanner extends StatefulWidget {
  final PageController pageController;
  final HomeController controller;

  const HomeScreenFirstBanner({
    super.key,
    required this.pageController,
    required this.controller,
  });

  @override
  _HomeScreenFirstBannerState createState() => _HomeScreenFirstBannerState();
}

class _HomeScreenFirstBannerState extends State<HomeScreenFirstBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: sOrange,
          ),
        );
      } else if (widget.controller.homeslider.value.data == null ||
          widget.controller.homeslider.value.data!.isEmpty) {
        return const Center(child: Text('No banners found'));
      } else {
        return Column(
          children: [
            CarouselSlider.builder(
              itemCount: widget.controller.homeslider.value.data!.length,
              itemBuilder: (context, index, realIndex) {
                final slider = widget.controller.homeslider.value.data![index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      slider.photo ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        );
      }
    });
  }
}
