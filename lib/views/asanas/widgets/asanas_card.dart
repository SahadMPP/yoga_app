import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/asanas/widgets/allasanas.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AsanaCard extends StatelessWidget {
  const AsanaCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.asanasCount,
      required this.id});

  final String imageUrl;
  final String name;
  final String asanasCount;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Allasanas(
              id: id,
            ));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            sh10,
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("$asanasCount Asanas",
                style: const TextStyle(color: Colors.black)),
            sh10
          ],
        ),
      ),
    );
  }
}
