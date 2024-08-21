import 'package:divyog/views/home/widgets/homescreen_programscard.dart';
import 'package:flutter/material.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({
    super.key,
    required this.imageurl,
  });

  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProgramCard(
                imageUrl: imageurl,
                title: "12-Minute Daily Pranyama",
                duration: '12 Mins',
                difficulty: "Beginner",
                isPro: true);
          }),
    );
  }
}
