import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:divyog/controller/userregistration/user_registration_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/validator/validator.dart';
import 'package:divyog/views/login/widgets/beziercontainer.dart';
import 'package:divyog/views/login/screen_login.dart';
import 'package:divyog/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.title});

  final String? title;

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonenumberControler = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final UserRegistrationController _controller =
      Get.put(UserRegistrationController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String selectedCountryCode = '+1'; // Default country code

  bool isLoading = false;
  void _updateCountryCode(String dialCode) {
    setState(() {
      selectedCountryCode = dialCode.replaceFirst('+', '');
    });
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        final phoneNumber = phonenumberControler.text.trim();
        final fullPhoneNumber = '$selectedCountryCode$phoneNumber';
        if (_formKey.currentState!.validate()) {
          setState(() {
            isLoading = true;
          });

          try {
            await _controller.registerUser(
              phoneNumber: fullPhoneNumber,
              email: emailController.text,
              name: namecontroller.text,
            );

            // Navigate to the next screen
            // Replace NextScreen with your target screen
          } catch (e) {
            // Handle error, show a message, etc.
            log('Registration error: $e');
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 247, 202, 99),
              Color.fromARGB(255, 248, 150, 2),
            ],
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              )
            : const Text(
                'Register Now',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: sOrange, fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
          text: 'D',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.orangeAccent),
          children: [
            TextSpan(
              text: 'iv',
              style: TextStyle(color: Color(0xFF81D4FA), fontSize: 30),
            ),
            TextSpan(
              text: 'yog',
              style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          entryField(
            "Username",
            controller: namecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          entryField(
            "Email id",
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }

              if (!isValidEmail(value)) {
                return 'Enter a valid email address';
              }

              return null;
            },
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CountryCodePicker(
                  onChanged: (country) {
                    _updateCountryCode(country.dialCode!);
                  },
                  initialSelection: 'US',
                  favorite: const ['+1', 'US'],
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: true,
                  showFlagMain: F,
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize:
                          20), // Change the color of the selected country code text
                  dialogTextStyle: const TextStyle(
                      color: Colors
                          .black), // Change the color of the dropdown items text
                  backgroundColor: sOrange,
                  // boxDecoration: BoxDecoration(color: sOrange),
                  barrierColor: Colors.transparent,
                  enabled: T,
                ),
              ),
              Expanded(
                flex: 3,
                child: entryField(
                  "Phone",
                  controller: phonenumberControler,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }

                    final cleanedNumber = cleanPhoneNumber(value);

                    if (!isValidPhoneNumber(cleanedNumber)) {
                      return 'Enter a valid phone number';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: const BezierContainer(),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    const SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    const SizedBox(height: 30),
                    _divider(),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() {
    return const Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
