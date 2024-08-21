import 'dart:developer';
import 'dart:io';
import 'package:divyog/controller/profile/profile_controller.dart';
import 'package:divyog/views/bottomnavigation/bottom_navigation.dart';
import 'package:divyog/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:divyog/model/get_profile/data.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../model/get_profile/user_details.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({
    super.key,
    required this.firstdata,
    required this.second,
  });

  final UserDetails firstdata;
  final Data second;

  @override
  UpdateProfileScreenState createState() => UpdateProfileScreenState();
}

class UpdateProfileScreenState extends State<UpdateProfileScreen> {
  File? _imageFile;
  final _picker = ImagePicker();

  late TextEditingController _bioController;
  late TextEditingController _weightController;
  late TextEditingController _heightController;
  late TextEditingController _nameController;
  final ProfileController editController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.second.name);
    _bioController = TextEditingController(text: widget.firstdata.bio);
    _weightController = TextEditingController(text: widget.firstdata.weight);
    _heightController = TextEditingController(text: widget.firstdata.height);
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      log("Picked image path: ${_imageFile?.path}");
    }
  }

  @override
  void dispose() {
    _bioController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  String _getImageFileName(String url) {
    final Uri uri = Uri.parse(url);
    return uri.pathSegments.last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: sblack, size: 20),
        ),
        centerTitle: true,
        title: const HeadingTextstyle(text: "E D I T  P R O F I L E"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // -- IMAGE with ICON
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: _imageFile == null
                          ? Image.network(
                              widget.firstdata.photo.toString(),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/DIVYOG-01-01-01.jpg",
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: sOrange,
                        ),
                        child: Icon(LineAwesomeIcons.camera_solid,
                            color: sWhite, size: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        label: Text("User Name"),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    sh20,
                    TextFormField(
                      controller: _bioController,
                      decoration: const InputDecoration(
                        label: Text("Bio"),
                        prefixIcon: Icon(LineAwesomeIcons.info_circle_solid),
                      ),
                    ),
                    sh20,
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        label: Text("Weight"),
                        prefixIcon: Icon(LineAwesomeIcons.weight_solid),
                      ),
                    ),
                    sh20,
                    TextFormField(
                      controller: _heightController,
                      decoration: const InputDecoration(
                        label: Text("Height"),
                        prefixIcon:
                            Icon(LineAwesomeIcons.ruler_horizontal_solid),
                      ),
                    ),
                    sh20,

                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            // Prepare parameters for editProfile
                            String bio = _bioController.text;
                            String height = _heightController.text;
                            String weight = _weightController.text;
                            String name = _nameController.text;

                            // Log the values for debugging
                            log("Bio: $bio, Height: $height, Weight: $weight, Name: $name");

                            // Conditionally add photo if selected
                            File? photo = _imageFile;

                            // Call the editProfile method
                            await editController.editProfile(
                              photo: photo,
                              bio: bio,
                              height: height,
                              weight: weight,
                              name: name,
                            );
                            editController.rebuildApp();

                            Get.snackbar("Successfully", "Edited Profile");
                            //ignore: use_build_context_synchronously
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ScreenSplash()));
                          } catch (e) {
                            // Show error message if the profile update fails
                            Get.snackbar(
                              "Error",
                              "Failed to update profile",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              colorText: Colors.red,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: sOrange,
                          side: BorderSide.none,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                            color: sWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    sh20,

                    // -- Joined Date and Delete Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(
                          TextSpan(
                            text: "Joined   ",
                            style: const TextStyle(fontSize: 12),
                            children: [
                              TextSpan(
                                text: widget.firstdata.createdAt!.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Handle delete logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide.none,
                          ),
                          child: const Text("Delete"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
