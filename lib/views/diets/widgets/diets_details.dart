import 'package:divyog/model/get_diets/diet.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenDietDetails extends StatefulWidget {
  const ScreenDietDetails(
      {super.key, required this.dietList, required this.title});
  final List<Diet>? dietList;
  final String title;

  @override
  ScreenDietDetailsState createState() => ScreenDietDetailsState();
}

class ScreenDietDetailsState extends State<ScreenDietDetails>
    with SingleTickerProviderStateMixin {
  late AnimationController
      _controller; // Animation controller for the fade-in and slide animations
  late Animation<double> _fadeInAnimation; // Animation for the fade-in effect
  late Animation<Offset> _slideAnimation; // Animation for the slide-in effect
  // Controller for managing diet data

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
          title: HeadingTextstyle(text: widget.title), // Title of the AppBar
          forceMaterialTransparency: true,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new, color: sblack, size: 20)),
        ),
        body: FadeTransition(
          opacity: _fadeInAnimation, // Fade-in animation for the content
          child: SlideTransition(
              position: _slideAnimation, // Slide-in animation for the content
              child: ListView.builder(
                  itemCount: widget.dietList!.length, // Number of diet items
                  itemBuilder: (context, index) {
                    final diet =
                        widget.dietList![index]; // Get the current diet item
                    return _buildDietOption(
                        label: "${diet.name}",
                        calories: "${diet.calories}",
                        carbs: "${diet.carbs}",
                        description: "${diet.description}",
                        fat: "${diet.fat}",
                        ingredients: "${diet.ingredients}",
                        protein: "${diet.protein}",
                        servings: "${diet.servings}",
                        time: "${diet.time}",
                        color: sOrange, // Color for the diet item
                        imageUrl:
                            '${diet.photo}'); // Image URL for the diet item
                  })),
        ));
  }
}

Widget _buildDietOption({
  required String label, // Label for the diet item
  required Color color, // Color for the diet item
  required String imageUrl, // Image URL for the diet item
  required String description, // Description for the diet item
  required String calories, // calories for the diet item
  required String carbs, // carbs for the diet item
  required String protein, // protein for the diet item
  required String fat, // fat for the diet item
  required String servings, // servings for the diet item
  required String ingredients, // ingredients for the diet item
  required String time, // time for the diet item
}) {
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Image Section
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: color.withOpacity(0.5),
                  width: 2,
                ),
              ),
            ),
            // Text Section
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "Description:  ${description}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "Ingredients:  $ingredients ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "Time: $time ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "CALORIES: $calories ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "Protins: $protein ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "fat: $fat ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    ),
                    Text(
                      "Serving: $servings ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: sblack,
                      ),
                    )
                  ]),
            )
          ])));
}
