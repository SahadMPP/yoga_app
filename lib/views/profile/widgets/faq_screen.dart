import 'package:divyog/controller/profile/profile_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key, required this.faqController});
  final ProfileController faqController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: const HeadingTextstyle(text: "F A Q"),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 18,
              )),
        ),
        body: Obx(() {
          if (faqController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: sOrange,
              ),
            );
          } else if (faqController.faq.value.data == null ||
              faqController.faq.value.data!.isEmpty) {
            return const Center(
              child: Text(" N O  F A Q  F O U N D"),
            );
          } else {
            return ListView.builder(
              itemCount: faqController.faq.value.data!.length,
              itemBuilder: (context, index) {
                final data = faqController.faq.value.data![index];
                return Obx(() {
                  final isExpanded = faqController.expandedIndex.value == index;
                  return Card(
                    elevation: 2.0,
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: InkWell(
                      onTap: () => faqController.toggleExpansion(index),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            title: Text("${data.question} ?"),
                            trailing: Icon(
                              isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                            ),
                          ),
                          AnimatedCrossFade(
                            firstChild: const SizedBox.shrink(),
                            secondChild: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "${data.answer}",
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            crossFadeState: isExpanded
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 500),
                          ),
                        ],
                      ),
                    ),
                  );
                });
              },
            );
          }
        }));
  }
}
