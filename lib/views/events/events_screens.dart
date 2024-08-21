import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/events/widgets/events_card.dart';
import 'package:divyog/views/events/widgets/events_heading.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class EventsScreens extends StatelessWidget {
  const EventsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        automaticallyImplyLeading: F,
        title: const HeadingTextstyle(text: "E V E N T S"),
      ),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: T,
          padding: const EdgeInsets.all(20),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: HeadingsOfevents(
                heading: "Weight Loss",
                viewallOnTap: () {
                  //Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/26867462/pexels-photo-26867462/free-photo-of-woman-in-red-top-exercising.jpeg?auto=compress&cs=tinysrgb&w=800"),
            sh20,

//============================ w e i g h t l o s s ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Yoga For Everyday",
                viewallOnTap: () {
                  //Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/317157/pexels-photo-317157.jpeg?auto=compress&cs=tinysrgb&w=800"),
            sh20,

//============================ Y o g a  f o r  e v e r y  d a y ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Multiple Day Program",
                viewallOnTap: () {
                  //Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/5012071/pexels-photo-5012071.jpeg?auto=compress&cs=tinysrgb&w=800"),
            sh20,

//============================ Multiple Day Program ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Meditation",
                viewallOnTap: () {
//Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/4056535/pexels-photo-4056535.jpeg?auto=compress&cs=tinysrgb&w=800"),
            sh20,

//============================ Meditation ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Shorter Programs",
                viewallOnTap: () {
                  // Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/3076509/pexels-photo-3076509.jpeg?auto=compress&cs=tinysrgb&w=800"),
            sh20,

//============================ Shorter Programs ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Hit",
                viewallOnTap: () {
                  //Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/3823063/pexels-photo-3823063.jpeg?auto=compress&cs=tinysrgb&w=800"),
            sh20,

//============================ Hit ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Dance Workouts",
                viewallOnTap: () {
                  //Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/3768695/pexels-photo-3768695.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load"),
            sh20,

//============================ Dance Workouts ====================>

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: HeadingsOfevents(
                heading: "Pilates",
                viewallOnTap: () {
                  //Get.to(() => Allasanas());
                },
              ),
            ),
            const EventsCard(
                imageurl:
                    "https://images.pexels.com/photos/7524706/pexels-photo-7524706.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load"),
            sh50
//============================ Pilates ====================>
          ]),
    );
  }
}
