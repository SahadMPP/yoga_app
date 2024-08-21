import 'package:divyog/controller/asanas/asanas_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/asanas/widgets/asanas_card.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsanasScreen extends StatelessWidget {
  AsanasScreen({super.key});

  final AsanasCategoryController controller =
      Get.put(AsanasCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: const HeadingTextstyle(
          text: "A S A N A S",
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: sOrange,
            ),
          );
        } else if (controller.asanasCategory.value.data == null ||
            controller.asanasCategory.value.data!.isEmpty) {
          return const Center(child: Text('No Categories found'));
        } else {
          final data = controller.asanasCategory.value.data ?? {};

          return GridView.builder(
            itemCount: data.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final key = data.keys.elementAt(index);
              final asanas = data[key];

              return AsanaCard(
                asanasCount: asanas?.count?.toString() ?? 'N/A',
                imageUrl: asanas?.photo ?? '',
                name: asanas?.name ?? 'Unknown',
                id: asanas?.id ?? 0,
              );
            },
          );
        }
      }),
    );
  }
}
