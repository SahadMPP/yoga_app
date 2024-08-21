import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:divyog/controller/auth/auth_controller.dart';
import 'package:divyog/utils/constants/colors.dart';
import 'package:divyog/utils/validator/validator.dart';
import 'package:divyog/views/login/widgets/beziercontainer.dart';
import 'package:divyog/views/signup/signup_page.dart';
import 'package:divyog/views/widgets/custom_or_divider.dart';
import 'package:divyog/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, this.title});

  final String? title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  String selectedCountryCode = '+1'; // Default country code
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool showOtpField = false;
  bool isLoading = false;
// Method to update selectedCountryCode

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -height * .15,
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
                    const SizedBox(height: 50),
                    _emailPasswordWidget(),
                    const SizedBox(height: 20),
                    _submitButton(),
                    SizedBox(height: height * .055),
                    divider(),
                    _createAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _updateCountryCode(String dialCode) {
    setState(() {
      selectedCountryCode = dialCode.replaceFirst('+', '');
    });
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        final phoneNumber = phonenumberController.text.trim();
        final fullPhoneNumber =
            '$selectedCountryCode$phoneNumber'; // Concatenate country code

        if (!showOtpField) {
          if (isValidPhoneNumber(phoneNumber)) {
            setState(() {
              isLoading = true;
            });

            final success = await authController.sendOtp(fullPhoneNumber);
            if (success) {
              setState(() {
                showOtpField = true;
              });
            }
            setState(() {
              isLoading = false;
            });
          } else {
            Get.snackbar("Error", "Invalid phone number");
          }
        } else {
          final otp = otpController.text.trim();

          if (otp.isNotEmpty) {
            setState(() {
              isLoading = true;
            });

            try {
              await authController.verifyOtp(otp);
            } catch (e) {
              Get.snackbar("Error", "OTP verification failed");
            } finally {
              setState(() {
                isLoading = false;
              });
            }
          } else {
            Get.snackbar("Error", "Please enter the OTP");
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
              color: Colors.grey.shade300,
              offset: const Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            )
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
            : Text(
                showOtpField ? "Login" : "Verify",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Don\'t have an account?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            const SizedBox(width: 10),
            Text(
              'Register',
              style: TextStyle(
                color: sOrange,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
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
          color: Colors.orangeAccent,
        ),
        children: [
          TextSpan(
            text: 'iv',
            style: TextStyle(color: Color(0xFF81D4FA), fontSize: 30),
          ),
          TextSpan(
            text: 'yog',
            style: TextStyle(color: Colors.orangeAccent, fontSize: 30),
          ),
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Row(
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
                  keyboardType: TextInputType.number,
                  controller: phonenumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showOtpField,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinCodeTextField(
                  textStyle: TextStyle(color: sblack, fontSize: 30),
                  keyboardType: TextInputType.number,
                  appContext: context,
                  length: 4,
                  controller: otpController,
                  animationType: AnimationType.scale,
                  pinTheme: PinTheme(
                    activeColor: sOrange100,
                    borderRadius: BorderRadius.circular(40),
                    shape: PinCodeFieldShape.circle,
                    selectedFillColor: sOrange100,
                    fieldHeight: 50,
                    fieldWidth: 70,
                    selectedColor: sOrange,
                    inactiveFillColor: sOrange100,
                    inactiveColor: sOrange,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {
                    log(value);
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
