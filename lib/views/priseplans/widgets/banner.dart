import 'package:divyog/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: sOrange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My ailments were a wake-up call for me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Thanks to my coaches, I\'m free of hypertension & obesity!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Handle get to know how button
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: sOrange,
              backgroundColor: Colors.white,
            ),
            child: const Text('GET TO KNOW HOW'),
          ),
        ],
      ),
    );
  }
}
