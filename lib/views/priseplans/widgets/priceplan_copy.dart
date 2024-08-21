import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/bottomnavigation/bottom_navigation.dart';
import 'package:divyog/views/priseplans/widgets/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/priseplans/widgets/banner.dart';

class MyPlansScreenWithSkip extends StatelessWidget {
  const MyPlansScreenWithSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          forceMaterialTransparency: true,
          automaticallyImplyLeading: F,
          title: const Text(
            'P L A N S',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                Get.to(() => const BottomNavBar());
              },
              child: Text(
                'S K I P  ',
                style: TextStyle(
                    color: sOrange, fontWeight: FontWeight.w300, fontSize: 15),
              ),
            )
          ]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const BannerSection().animate().fadeIn(duration: 1.seconds),
          sh20,
          const PlanCard(
            title: 'Divyog Smart',
            price: 'Starts at ₹350 per month',
            description: 'Get Your Personal Weight Loss AI :',
            features: [
              'Ria - Personal AI Coach',
              'Personalized Diet Plan',
              'Home/ Gym Workout Plan',
            ],
            buttonText: 'EXPLORE DIVYOG SMART',
            image:
                'https://images.pexels.com/photos/3822864/pexels-photo-3822864.jpeg?auto=compress&cs=tinysrgb&w=800',
          ).animate().slide(duration: 1.seconds),
          sh15,
          const PlanCard(
            title: 'Divyog Pro',
            price: 'Starts at ₹3,437/m ₹4,400/m',
            description: 'Not Just Weight Loss. Smart Weight Loss.',
            features: [
              '2 Pro Coaches',
              'Divyog Me Smart Scale (On Plans 6 months & above)',
              'Ria - Your AI Guide',
            ],
            buttonText: 'KNOW MORE',
            image:
                'https://images.pexels.com/photos/3822864/pexels-photo-3822864.jpeg?auto=compress&cs=tinysrgb&w=800',
          ).animate().slide(duration: 1.5.seconds),
          sh15,
          const PlanCard(
            title: 'Hypertension Pro',
            price: 'Starts at ₹3,650/m ₹5,000/m',
            description:
                'Smart weight loss and Hypertension management with 2 Hypertension specialists.',
            features: [
              '2 Hypertension Specialists',
              'Divyog Me Smart Scale (On Plans 6 months & above)',
              'Ria - Your AI Guide',
            ],
            buttonText: 'KNOW MORE',
            image:
                'https://images.pexels.com/photos/3822864/pexels-photo-3822864.jpeg?auto=compress&cs=tinysrgb&w=800',
          ).animate().slide(duration: 2.seconds),
          sh20,
          Center(
            child: GlassmorphicContainer(
              width: double.infinity,
              height: 50,
              borderRadius: 15,
              blur: 10,
              alignment: Alignment.center,
              border: 2,
              linearGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.1),
                  Colors.white.withOpacity(0.1)
                ],
                stops: const [0.1, 1],
              ),
              borderGradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.5)
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {
                  // Handle view other plans
                },
                child: Text(
                  'VIEW OTHER PLANS',
                  style: TextStyle(color: sWhite),
                ),
              ).animate().scale(duration: 0.5.seconds),
            ),
          ),
          sh30,
        ],
      ),
    );
  }
}
