import 'package:flutter/material.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/asanas/asanas_screen.dart';
import 'package:divyog/views/events/events_screens.dart';
import 'package:divyog/views/home/home_screen.dart';
import 'package:divyog/views/personalprograms/personal_programs.dart';
import 'package:divyog/views/profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> tabItems = [
    HomeScreen(),
    const EventsScreens(),
    AsanasScreen(),
    const YogaProgramScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: sWhite,
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors
            .white, // Make background transparent to see the container color
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.orange,
        showUnselectedLabels: true,

        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.event, 1),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(
              Icons.personal_injury,
              2,
            ),
            label: 'Asanas',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.personal_video_outlined, 3),
            label: 'Personal',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 4),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData? iconData, int index, {Widget? customIcon}) {
    return Container(
      decoration: index == _selectedIndex
          ? BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.orangeAccent.withOpacity(0.8),
                    blurRadius: 20,
                    spreadRadius: 3,
                    offset: const Offset(0, -5)),
              ],
            )
          : null,
      child: customIcon ?? Icon(iconData),
    );
  }
}
