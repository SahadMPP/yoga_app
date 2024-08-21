import 'package:divyog/views/home/widgets/homescreen_programscard.dart';
import 'package:flutter/material.dart';

class HomeScreenPurchasedPrograms extends StatelessWidget {
  const HomeScreenPurchasedPrograms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child:
            // Obx(() {
            //   if (feuturedController.isLoading.value) {
            //     return Center(
            //       child: CircularProgressIndicator(
            //         color: sOrange,
            //       ),
            //     );
            //   } else if (feuturedController.featuredPrograms.value.data == null ||
            //       feuturedController.featuredPrograms.value.data!.isEmpty) {
            //     return const Center(child: Text('No Programs found'));
            //   } else {
            //     return
            ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //Get.to(() => Allasanas());
                    },
                    child: const ProgramCard(
                        imageUrl:
                            "https://images.pexels.com/photos/3759657/pexels-photo-3759657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
                        title: "Chakrasa",
                        duration: '10 Min',
                        difficulty: "Beginner",
                        isPro: true),
                  );
                }));
  }
}
