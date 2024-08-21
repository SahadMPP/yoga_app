import 'package:flutter/material.dart';

class HeadingTextstyle extends StatelessWidget {
  const HeadingTextstyle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
    );
  }
}
