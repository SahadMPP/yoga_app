import 'package:divyog/controller/diets/diets_controller.dart';
import 'package:divyog/model/get_diets/diet.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/diets/widgets/diets_details.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenDiet extends StatefulWidget {
  const ScreenDiet({super.key});

  @override
  ScreenDietState createState() => ScreenDietState();
}

class ScreenDietState extends State<ScreenDiet>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _controller; // Animation controller for the fade-in and slide animations
  late Animation<double> _fadeInAnimation; // Animation for the fade-in effect
  late Animation<Offset> _slideAnimation; // Animation for the slide-in effect
  final DietsController dietsController =
      Get.put(DietsController()); // Controller for managing diet data

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Animations
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Duration of the animation
      vsync: this,
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn, // Animation curve for the fade-in effect
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5), // Starting position for the slide animation
      end: Offset.zero, // Ending position for the slide animation
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // Animation curve for the slide-in effect
      ),
    );

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose the animation controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const HeadingTextstyle(text: "D I E T"), // Title of the AppBar
          forceMaterialTransparency: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new, color: sblack, size: 20)),
        ),
        body: Obx(() {
          if (dietsController.isLoading.value) {
            // If the diet data is still loading
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: sOrange,
              ),
            );
          } else if ((dietsController.diets.value.data == null)) {
            // If no diet data is found
            return const Center(child: Text('No Profile Found'));
          } else {
            // If diet data is available
            return FadeTransition(
              opacity: _fadeInAnimation, // Fade-in animation for the content
              child: SlideTransition(
                  position:
                      _slideAnimation, // Slide-in animation for the content
                  child: ListView.builder(
                      itemCount: dietsController
                          .diets.value.data!.length, // Number of diet items
                      itemBuilder: (context, index) {
                        final diet = dietsController.diets.value
                            .data![index]; // Get the current diet item
                        return _buildDietOption(
                            dietList: diet.diets,
                            title: "${diet.name}",
                            label: '${diet.name}', // Label for the diet item
                            color: sOrange, // Color for the diet item
                            imageUrl:
                                '${diet.photo}'); // Image URL for the diet item
                      })),
            );
          }
        }));
  }

  Widget _buildDietOption(
      {required String label,
      required Color color,
      required String imageUrl,
      required List<Diet>? dietList,
      required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
          color: Colors.white,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(imageUrl),
          ),
          title: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.arrow_forward_ios,
              color: color,
              size: 20,
            ),
          ),
          onTap: () {
            Get.to(() => ScreenDietDetails(dietList: dietList, title: title));
          },
        ),
      ),
    );
  }
}
