import 'package:divyog/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppBarWithGradient extends StatelessWidget {
  const AppBarWithGradient(
      {super.key,
      required this.title,
      required this.icon,
      required this.onpressed});

  final String title;
  final IconData icon;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: sblue, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IconButton(
              icon: Icon(
                icon,
                color: sblue,
                size: 30,
              ),
              onPressed: onpressed),
        ),
      ],
    );
  }
}
