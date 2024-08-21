// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:animated_weight_picker/animated_weight_picker.dart';
import 'package:divyog/controller/completeprofile/complete_profile_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/constants/height_width.dart';
import 'package:divyog/views/widgets/heading_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key, this.title});

  final String? title;

  @override
  CompleteProfileState createState() => CompleteProfileState();
}

class CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController dobController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController goalsController = TextEditingController();
  final TextEditingController diseasesController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final CompleteProfileController _controller =
      Get.put(CompleteProfileController());

  String? selectedDiet;
  Position? _currentPosition;
  XFile? _profileImage;
  bool _isLoading = true;

  final ImagePicker _picker = ImagePicker();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _diseases = [
    'Diabetes',
    'Hypertension',
    'Heart Disease',
    'None'
  ];
  final List<String> _dietPreferences = [
    'Vegeterian',
    'Eggeterian',
    'Non-Vegeterian',
  ]; // Example diseases
  List<String> genderOptions = ['male', 'female', 'other'];
  String? selectedGender;
  List<String> _selectedDiseases = []; // Changed from String to List<String>

  String? _selectedDiet;
  var selectedIntrests;
  DateTime? _selectedDateOfBirth;
  final double min = 0;
  final double max = 200;
  String selectedWeight = '';

  @override
  void initState() {
    super.initState();
    selectedWeight = min.toString();

    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: sWhite,
        appBar: AppBar(
          title: const Text(
            'C O M P L E T E   P R O F I L E ',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
          ),
          centerTitle: T,
          automaticallyImplyLeading: F,
          backgroundColor: sWhite,
          forceMaterialTransparency: F,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          children: [
            // First Page
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _profileImagePicker(),
                  sh10,
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: _textField('Date of Birth', dobController,
                        isDate: true),
                  ),
                  sh20,
                  _genderSelector(),
                  sh20,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: sOrange,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: _isFirstPageCompleted() ? _onNextPage : null,
                    child: const Text(
                      'N E X T',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w300),
                    ),
                  ),
                  ClipRRect(
                    child: Image.asset(
                      'assets/DIVYOG-01-01-01.jpg',
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            // Second Page
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      'assets/DIVYOG-01-01-01.jpg',
                      height: 300,
                    ),
                  ),
                  const HeadingTextstyle(text: "Select Your Weight"),
                  sh10,
                  AnimatedWeightPicker(
                      min: min,
                      max: max,
                      onChange: (newValue) {
                        setState(() {
                          selectedWeight = newValue;
                        });
                      }),
                  _textField('Height', heightController),
                  _textField('Bio', bioController),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: sOrange,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: _isSecondPageCompleted() ? _onNextPage : null,
                    child: Text(
                      'N E X T',
                      style: TextStyle(color: sWhite),
                    ),
                  ),
                ],
              ),
            ),
            // Location Page
            Obx(() {
              if (_controller.isLoading.value) {
                return Center(
                    child: CircularProgressIndicator(
                  color: sOrange,
                ));
              } else if (_controller.completeProfileCategory.value.data ==
                  null) {
                return const Text('No categories found');
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          'assets/DIVYOG-01-01-01.jpg',
                          height: 300,
                        ),
                      ),
                      const HeadingTextstyle(text: "diet Preferences"),
                      sh20,
                      dietPreferences(),
                      const HeadingTextstyle(text: "Intrestes"),
                      sh20,
                      intrestes(),
                      sh10,
                      const HeadingTextstyle(
                          text: "Do you have any medical conditions?"),
                      sh30,
                      _diseasesChips(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: sOrange,
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: _isLocationPageCompleted()
                            ? () {
                                _controller.submitCompleteProfile(
                                    photo: File(_profileImage!.path),
                                    dob: _selectedDateOfBirth.toString(),
                                    height: heightController.text,
                                    weight: selectedWeight,
                                    gender: selectedGender.toString(),
                                    selectedCategories:
                                        _controller.selectedCategories,
                                    diseases: _selectedDiseases,
                                    location: locationController.text,
                                    bio: bioController.text,
                                    dietPreferences: ["$_selectedDiet"]);
                              }
                            : null,
                        child: _controller.submitisLoading.value
                            ? CircularProgressIndicator(
                                color: sWhite,
                                strokeWidth: 2,
                                strokeAlign: -5,
                              )
                            : Text(
                                'S U B M I T',
                                style: TextStyle(color: sWhite),
                              ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ],
        ));
  }

  Widget _genderSelector() {
    return Column(
      children: [
        const Text(
          'Gender',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        sh10,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: genderOptions.map((gender) {
            return Expanded(
              child: ChoiceChip(
                side: BorderSide(color: sWhite),
                backgroundColor: sOrange100,
                shadowColor: sGreen,
                checkmarkColor: sOrange,
                label: Text(gender),
                selected: selectedGender == gender,
                onSelected: (selected) {
                  setState(() {
                    selectedGender = selected ? gender : null;
                  });
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget dietPreferences() {
    return Wrap(
      spacing: 8.0,
      children: _dietPreferences.map((diet) {
        return ChoiceChip(
          backgroundColor: sWhite,
          side: BorderSide(color: sOrange),
          label: Text(diet),
          selected: _selectedDiet == diet,
          onSelected: (selected) {
            setState(() {
              _selectedDiet = selected ? diet : null;
            });
          },
        );
      }).toList(),
    );
  }

  Widget intrestes() {
    return Wrap(
      spacing: 8.0,
      runSpacing: 4.0,
      children: _controller.completeProfileCategory.value.data!.map((category) {
        selectedIntrests =
            _controller.selectedCategories.contains("${category.id}");
        return ChoiceChip(
          backgroundColor: sWhite,
          side: BorderSide(color: sOrange),
          label: Text(category.name.toString()),
          selected: selectedIntrests,
          onSelected: (bool selected) {
            if (selected) {
              _controller.selectedCategories.add("${category.id}");
            } else {
              _controller.selectedCategories.remove("${category.id}");
            }
          },
        );
      }).toList(),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _isLoading = false;
      });
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        setState(() {
          _isLoading = false;
        });
        return Future.error('Location permissions are denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
      locationController.text = '${position.latitude}, ${position.longitude}';
      _isLoading = false;
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = image;
    });
  }

  Future<void> _selectDateOfBirth() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDateOfBirth) {
      setState(() {
        _selectedDateOfBirth = pickedDate;
        dobController.text = '${pickedDate.toLocal()}'.split(' ')[0];
      });
    }
  }

  Widget _profileImagePicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _pickImage,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: _profileImage != null
                ? FileImage(File(_profileImage!.path))
                : null,
            child: _profileImage == null
                ? const Icon(
                    Icons.camera_alt,
                    size: 30,
                    color: Colors.grey,
                  )
                : null,
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Upload your image',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: sblack,
          ),
        ),
      ],
    );
  }

  Widget _textField(String label, TextEditingController controller,
      {bool isDate = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!isDate)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              width: 300,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(color: sblack),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.orange.shade100, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Colors.orange.shade100, width: 2),
                  ),
                  filled: true,
                  fillColor: sWhite,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
            ),
          ),
        if (isDate)
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: GestureDetector(
              onTap: _selectDateOfBirth,
              child: AbsorbPointer(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: label,
                    labelStyle: TextStyle(color: Colors.orange),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Colors.orange.shade100, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Colors.orange.shade100, width: 2),
                    ),
                    filled: true,
                    fillColor: sWhite,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _dropdownField(String label, List<String> items, String? selectedValue,
      Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        width: 300,
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: sblack),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.orange.shade100, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.orange.shade100, width: 2),
            ),
            filled: true,
            fillColor: sWhite,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _diseasesChips() {
    return Wrap(
      spacing: 8.0,
      children: _diseases.map((disease) {
        bool isSelected = _selectedDiseases.contains(disease);
        return ChoiceChip(
          backgroundColor: sWhite,
          side: BorderSide(color: sOrange),
          label: Text(disease),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedDiseases.add(disease);
              } else {
                _selectedDiseases.remove(disease);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _locationField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: 300,
        child: TextField(
          controller: locationController,
          readOnly: true,
          decoration: InputDecoration(
            labelText: 'Location',
            labelStyle: TextStyle(color: Colors.orange),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.orange.shade100, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.orange.shade100, width: 2),
            ),
            filled: true,
            fillColor: sWhite,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ),
    );
  }

  bool _isFirstPageCompleted() {
    return dobController.text.isNotEmpty &&
        selectedGender != null &&
        _profileImage != null;
  }

  bool _isSecondPageCompleted() {
    return selectedWeight != null &&
        heightController.text != null &&
        bioController.text != null;
  }

  bool _isLocationPageCompleted() {
    return locationController.text.isNotEmpty;
  }

  void _onNextPage() {
    if (_currentPage == 0 && _isFirstPageCompleted()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (_currentPage == 1 && _isSecondPageCompleted()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (_currentPage == 2 && _isLocationPageCompleted()) {
      // Save data and submit
    }
  }
}
