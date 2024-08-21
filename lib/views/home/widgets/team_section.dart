import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TeamSectionWidget extends StatelessWidget {
  final List<String> imagePaths;

  const TeamSectionWidget({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
        return Container(
            height: 40,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://srichaitanyaias.net/wp-content/uploads/2022/04/SrichaitanyaIAS-Website_6.jpg',
                fit: BoxFit.cover,
              ),
            ));
      },
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 1.9,
        viewportFraction: 0.6,
      ),
    );
  }
}
