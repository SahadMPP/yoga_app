import 'package:divyog/controller/home/home_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/home/widgets/homescreen_programscard.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreenFeautredBanner extends StatelessWidget {
  const HomeScreenFeautredBanner({
    super.key,
    required this.feuturedController,
  });
  final HomeController feuturedController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Obx(() {
          if (feuturedController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: sOrange,
              ),
            );
          } else if (feuturedController.featuredPrograms.value.data == null ||
              feuturedController.featuredPrograms.value.data!.isEmpty) {
            return const Center(child: Text('No Programs found'));
          } else {
            return ListView.builder(
                itemCount:
                    feuturedController.featuredPrograms.value.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final data =
                      feuturedController.featuredPrograms.value.data![index];
                  return GestureDetector(
                    onTap: () {
                      //Get.to(() => Allasanas());
                    },
                    child: ProgramCard(
                        imageUrl: "${data.photo}",
                        title: "${data.title}",
                        duration: '${data.duration}',
                        difficulty: "${data.difficulty}",
                        isPro: true),
                  );
                });
          }
        }));
  }
}
