import 'package:divyog/controller/home/home_controller.dart';
import 'package:divyog/controller/profile/profile_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/home/widgets/home_screen_firstbanner.dart';
import 'package:divyog/views/home/widgets/home_screen_purchased_programs.dart';
import 'package:divyog/views/home/widgets/home_screen_secondbanner.dart';
import 'package:divyog/views/home/widgets/homescreen_feautered.dart';
import 'package:divyog/views/home/widgets/team_section.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:divyog/views/widgets/pro_card.dart';
import 'package:divyog/views/widgets/subheading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final PageController _pageController = PageController();
  final HomeController homeController = Get.put(HomeController());
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 80,
        leading: Obx(() {
          final profile = profileController.profile.value.data?.userDetails;
          return Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: sOrange100,
              backgroundImage: profile != null && profile.photo != null
                  ? NetworkImage(profile.photo!, scale: 2)
                  : const AssetImage(
                      "assets/DIVYOG-01-01-01.jpg",
                    ),
            ),
          );
        }),
        title: Obx(() {
          final profile = profileController.profile.value.data;
          return Text("Hey, ${profile?.name ?? "Guest"} 👋");
        }),
        titleTextStyle: const TextStyle(
          fontSize: 17,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Colors.orange,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.orange,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: sOrange,
            ),
          );
        }

        return SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              HomeScreenFirstBanner(
                pageController: _pageController,
                controller: homeController,
              ),
              sh20,
              HomescreenSecondBanner(
                controller: homeController,
              ),
              sh20,
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingTextstyle(
                      text: "FEATURED PROGRAMS",
                    ),
                    SubheadingTextstyle(text: "VIEW ALL")
                  ],
                ),
              ),
              HomeScreenFeautredBanner(
                feuturedController: homeController,
              ),
              sh20,
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingTextstyle(
                      text: "PURCHASED PROGRAMS",
                    ),
                    SubheadingTextstyle(text: "VIEW ALL")
                  ],
                ),
              ),
              const HomeScreenPurchasedPrograms(),
              sh20,
              const ProCard(),
              sh20,
              const HeadingTextstyle(
                text: "OUR TEAMS",
              ),
              sh20,
              const TeamSectionWidget(imagePaths: [
                'https://srichaitanyaias.net/wp-content/uploads/2022/04/SrichaitanyaIAS-Website_6.jpg'
              ])
            ],
          ),
        );
      }),
    );
  }
}
