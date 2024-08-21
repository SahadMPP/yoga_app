import 'package:flutter/material.dart';

Widget entryField(String title,
    {bool isPassword = false,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    required String? Function(String?) validator}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            keyboardType: keyboardType,
            controller: controller,
            validator: validator,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.orange[50],
                //fillColor: Color(0xfff3f3f4),
                filled: true))
      ],
    ),
  );
}
