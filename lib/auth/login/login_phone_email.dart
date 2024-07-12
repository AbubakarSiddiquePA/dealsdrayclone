import 'package:dealsdray/auth/auth_provider/auth_provider.dart';
import 'package:dealsdray/auth/login/login_otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';

class LoginPhoneEmail extends StatefulWidget {
  const LoginPhoneEmail({super.key});

  @override
  State<LoginPhoneEmail> createState() => _LoginPhoneEmailState();
}

class _LoginPhoneEmailState extends State<LoginPhoneEmail> {
  TextEditingController phoneNumberController = TextEditingController();

  bool isPhoneSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "images/dealsDray.png",
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 16),
              CustomSlidingSegmentedControl<int>(
                children: const {
                  1: Text("Phone"),
                  2: Text("Email"),
                },
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                thumbDecoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                initialValue: isPhoneSelected ? 1 : 2,
                onValueChanged: (int value) {
                  setState(() {
                    isPhoneSelected = (value == 1);
                  });
                },
              ),
              const SizedBox(height: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Glad to see you!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isPhoneSelected
                        ? 'Please provide your phone number'
                        : 'Please provide your email',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    key: ValueKey(
                        isPhoneSelected), // Change the key to force rebuild
                    controller: phoneNumberController,
                    keyboardType: isPhoneSelected
                        ? TextInputType.phone
                        : TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: isPhoneSelected ? 'Phone' : 'Email',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Consumer<AuthProvider>(
                    builder: (context, provider, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 60),
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {
                          provider
                              .sendOtp(context,
                                  mobileNumber: phoneNumberController.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OTPVerification(),
                                ));
                          });
                        },
                        child: const Text(
                          'SEND CODE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
