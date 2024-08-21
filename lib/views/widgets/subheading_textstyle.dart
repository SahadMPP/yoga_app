import 'package:divyog/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class SubheadingTextstyle extends StatelessWidget {
  const SubheadingTextstyle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14, color: sblue),
    );
  }
}
