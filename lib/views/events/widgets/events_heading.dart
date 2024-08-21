import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:divyog/views/widgets/subheading_textstyle.dart';
import 'package:flutter/material.dart';

class HeadingsOfevents extends StatelessWidget {
  const HeadingsOfevents({
    super.key,
    required this.heading,
    required this.viewallOnTap,
  });
  final String heading;
  final Function() viewallOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeadingTextstyle(
          text: heading,
        ),
        InkWell(
            onTap: viewallOnTap,
            child: const SubheadingTextstyle(text: "VIEW ALL"))
      ],
    );
  }
}
