import 'dart:developer';

import 'package:divyog/controller/profile/profile_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/utils/helper/login_helper.dart';
import 'package:divyog/utils/secure/secure_storage.dart';
import 'package:divyog/views/diets/screen_diets.dart';
import 'package:divyog/views/login/screen_login.dart';
import 'package:divyog/views/offlinedownloads/offline_download.dart';
import 'package:divyog/views/profile/widgets/edit_profile.dart';
import 'package:divyog/views/profile/widgets/faq_screen.dart';
import 'package:divyog/views/profile/widgets/profile_menu_widget.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:divyog/views/widgets/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: const HeadingTextstyle(text: "P R O F I L E"),
        ),
        body: Obx(() {
          if (profileController.isLoading.value &&
              profileController.isLogoutLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: sOrange,
              ),
            );
          } else if ((profileController.profile.value.data!.userDetails ==
              null)) {
            return const Center(child: Text('No Profile Found'));
          } else {
            final profileFirst = profileController.profile.value.data;
            final profile = profileController.profile.value.data?.userDetails;
            return Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  /// -- IMAGE
                  Stack(
                    children: [
                      SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: profile != null && profile.photo != null
                                ? FadeInImage.assetNetwork(
                                    placeholder: "assets/DIVYOG-01-01-01.jpg",
                                    image: profile.photo!,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "assets/F6825E70-7E37-40E8-9ACF-4FC70C17CBBE_4_5005_c.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                          )),
                      //
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text("${profileFirst!.name}",
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text("${profile!.bio}",
                      style: Theme.of(context).textTheme.bodyMedium),
                  sh20,

                  /// -- BUTTON
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        log(profile.photo.toString());
                        Get.to(() => UpdateProfileScreen(
                              firstdata: profile,
                              second: profileFirst,
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: sOrange,
                          side: BorderSide.none,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      child: Text("EDIT PROFILE ",
                          style: TextStyle(
                              color: sWhite, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  sh10,
                  Divider(
                    color: sOrange100,
                  ),

                  /// -- MENU

                  Expanded(
                    child: ListView(
                      // This is a ListView that contains ProfileMenuWidget for each menu item.
                      children: [
                        ProfileMenuWidget(
                          // The title of the menu item.
                          title: "Settings",
                          // The icon for the menu item.
                          icon: LineAwesomeIcons.cogs_solid,
                          // The function to call when the menu item is pressed.
                          onPress: () {},
                        ),
                        ProfileMenuWidget(
                          title: "Downloads",
                          icon: LineAwesomeIcons.file_download_solid,
                          onPress: () {
                            // When the Downloads menu item is pressed, navigate to the OfflineDownloadsScreen.
                            Get.to(() => const OfflineDownloadsScreen());
                          },
                        ),
                        ProfileMenuWidget(
                          title: "Subscriptions history",
                          icon: LineAwesomeIcons.wallet_solid,
                          onPress: () {},
                        ),
                        ProfileMenuWidget(
                          title: "Billing history",
                          icon: LineAwesomeIcons.wallet_solid,
                          onPress: () {},
                        ),
                        ProfileMenuWidget(
                          title: "Diets",
                          icon: Icons.space_dashboard_outlined,
                          onPress: () {
                            // When the Diets menu item is pressed, navigate to the ScreenDiet.
                            Get.to(() => const ScreenDiet());
                          },
                        ),
                        ProfileMenuWidget(
                          title: "User Management",
                          icon: LineAwesomeIcons.user_check_solid,
                          onPress: () {},
                        ),
                        ProfileMenuWidget(
                          title: "Contact Us",
                          icon: Icons.contact_support_sharp,
                          onPress: () async {
                            makePhoneCall("917306533275");
                          },
                        ),
                        ProfileMenuWidget(
                          title: "Faq",
                          icon: LineAwesomeIcons.foursquare,
                          onPress: () {
                            Get.to(() =>
                                FAQScreen(faqController: profileController));
                          },
                        ),
                        ProfileMenuWidget(
                          title: " Favourites",
                          textColor: sGreen,
                          icon: Icons.favorite_outline_outlined,
                          onPress: () {},
                        ),
                        ProfileMenuWidget(
                          title: "Logout",
                          icon: Icons.logout,
                          textColor: Colors.red,
                          endIcon: false,
                          onPress: () {
                            // When the Logout menu item is pressed, show a dialog to confirm the logout.
                            Get.defaultDialog(
                              backgroundColor: sOrange100,
                              title: "LOGOUT",
                              titleStyle: const TextStyle(fontSize: 20),
                              content: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15.0),
                                child:
                                    Text("Are you sure, you want to Logout?"),
                              ),
                              confirm: ElevatedButton(
                                onPressed: () async {
                                  // If the user confirms the logout, delete data from secure storage, delete the token, logout the user, and navigate to the LoginPage.
                                  await LoginHelper.deleteDataFromSf();
                                  SecureStorage().deleteToken();
                                  profileController.logout();
                                  Get.offAll(() => const LoginPage());
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: Colors.red.shade200,
                                    side: BorderSide.none),
                                child: const Text("Yes"),
                              ),
                              cancel: ElevatedButton(
                                onPressed: () {
                                  // If the user cancels the logout, close the dialog.
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: BeveledRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: sWhite,
                                    side: BorderSide.none),
                                child: const Text("No"),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ]));
          }
        }));
  }
}
