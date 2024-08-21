// import 'package:divyog/utils/constants/colors.dart';
// import 'package:divyog/utils/constants/height_width.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class CompleteProfileFirstPage extends StatefulWidget {
//   const CompleteProfileFirstPage({super.key});

//   @override
//   State<CompleteProfileFirstPage> createState() =>
//       _CompleteProfileFirstPageState();
// }

// class _CompleteProfileFirstPageState extends State<CompleteProfileFirstPage> {

//     XFile? _profileImage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: sWhite,
//         appBar: AppBar(
//           title: const Text(
//             'C O M P L E T E   P R O F I L E ',
//             style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
//           ),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//           backgroundColor: sWhite,
//           forceMaterialTransparency: false,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               _profileImagePicker(),
//               sh10,
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: _textField('Date of Birth', dobController, isDate: true),
//               ),
//               sh20,
//               _genderSelector(),
//               sh20,
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     backgroundColor: sOrange,
//                     shape: BeveledRectangleBorder(
//                         borderRadius: BorderRadius.circular(10))),
//                 onPressed: () {},
//                 child: const Text(
//                   'N E X T',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w300),
//                 ),
//               ),
//               ClipRRect(
//                 child: Image.asset(
//                   'assets/DIVYOG-01-01-01.jpg',
//                   height: 200,
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }

//   Widget _profileImagePicker() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         GestureDetector(
//           onTap: _pickImage,
//           child: CircleAvatar(
//             radius: 50,
//             backgroundColor: Colors.grey.shade200,
//             backgroundImage: _profileImage != null
//                 ? FileImage(File(_profileImage!.path))
//                 : null,
//             child: _profileImage == null
//                 ? const Icon(
//                     Icons.camera_alt,
//                     size: 30,
//                     color: Colors.grey,
//                   )
//                 : null,
//           ),
//         ),
//         const SizedBox(height: 30),
//         Text(
//           'Upload your image',
//           style: TextStyle(
//             fontWeight: FontWeight.w300,
//             fontSize: 16,
//             color: sblack,
//           ),
//         ),
//       ],
//     );
//   }
// }
