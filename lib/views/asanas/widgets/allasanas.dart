import 'package:divyog/controller/asanas/asanas_category.dart';
import 'package:divyog/views/player/player.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';

class Allasanas extends StatelessWidget {
  final AsanasListController controller = Get.put(AsanasListController());
  final int id;
  Allasanas({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // Fetch the asanas list on widget initialization
    controller.fetchAsanasList(id);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: sblack, size: 20)),
        centerTitle: true,
        forceMaterialTransparency: true,
        title: const HeadingTextstyle(text: "A L L   A S A N A S"),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Obx(() {
            if (controller.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: sOrange,
                ),
              );
            } else if (controller.asanasList.value.data == null ||
                controller.asanasList.value.data!.asanas!.isEmpty) {
              return const Center(child: Text('No Asanas found'));
            } else {
              return ListView.builder(
                itemCount: controller.asanasList.value.data!.asanas!.length,
                itemBuilder: (BuildContext context, int index) {
                  final asana =
                      controller.asanasList.value.data!.asanas![index];

                  // Pro Tag Widget
                  Widget proTag = Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      'Pro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Player(
                                tag: index,
                              )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Hero(
                            tag: index,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                asana.photo ?? '',
                                fit: BoxFit.cover,
                                width: 150,
                                height: 100,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(asana.title ?? 'Unknown Asana'),
                                  if (asana.type != 0)
                                    proTag, // Show Pro tag if type is not 0
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Duration: ${asana.duration ?? 'Unknown'}"),
                                  Text(
                                      "Difficulty: ${asana.difficulty ?? 'Unknown'}")
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }
}
