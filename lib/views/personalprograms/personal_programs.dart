import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/player/player.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class YogaProgramScreen extends StatelessWidget {
  const YogaProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: T,
        title: Text('P E R S O N A L I Z E D',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 18))),
        automaticallyImplyLeading: F,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildWelcomeMessage(),
            _buildYogaProgramList(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Discover Your Personalized Yoga Programs',
        style: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: sOrange,
        ),
        textAlign: TextAlign.center,
      ).animate().fadeIn(duration: const Duration(seconds: 1)).slideY(),
    );
  }

  Widget _buildYogaProgramList() {
    final programs = [
      {'name': 'Morning Yoga', 'duration': '30 mins', 'icon': Icons.wb_sunny},
      {
        'name': 'Relaxing Yoga',
        'duration': '45 mins',
        'icon': Icons.nightlight
      },
      {
        'name': 'Flexibility',
        'duration': '20 mins',
        'icon': Icons.accessibility
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: programs.length,
      itemBuilder: (context, index) {
        final program = programs[index];
        return Card(
          shadowColor: sOrange,
          color: sWhite,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: Icon(program['icon'] as IconData, color: sOrange),
            title: Text(
              'name',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
            subtitle: Text(
              '12 MIN',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: sOrange),
            onTap: () {
              Get.to(() => const Player(tag: 1));
            },
          ),
        ).animate().fadeIn(duration: const Duration(seconds: 1)).slideX();
      },
    );
  }
}
