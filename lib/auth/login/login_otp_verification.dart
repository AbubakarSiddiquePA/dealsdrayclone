import 'dart:async';
import 'package:dealsdray/auth/auth_provider/auth_provider.dart';
import 'package:dealsdray/auth/signup/signup_lets_begin.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  TextEditingController otpController = TextEditingController();
  int _timerSeconds = 117; // 1 minute 57 seconds
  late Timer _timer;
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _isDisposed = true;
    _timer.cancel();
    otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_isDisposed) {
        timer.cancel();
        return;
      }
      if (_timerSeconds > 0) {
        setState(() {
          _timerSeconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "images/download-removebg-preview.png",
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 40,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "OTP Verification",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We have sent a unique OTP number\nyour mobile number +91 6238824067",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                    textAlign: TextAlign.start, // Align text to start
                  ),
                ],
              ),
              const SizedBox(height: 46),
              Consumer<AuthProvider>(builder: (context, snapshot, _) {
                return PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(16),
                    fieldHeight: 55,
                    fieldWidth: 55,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.blue,
                    selectedColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  onCompleted: (value) {
                    if (_isDisposed) return;
                    //  handle OTP completion
                    if (!_isDisposed) {
                      snapshot
                          .verifyOtp(context, otp: otpController.text)
                          .then((value) {
                        if (!_isDisposed) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpBegin(),
                              ));
                        }
                      });
                    }
                  },
                  onChanged: (value) {
                    if (_isDisposed) return;
                    // handle OTP change
                  },
                );
              }),
              const SizedBox(height: 16),
              Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${(_timerSeconds ~/ 60).toString().padLeft(2, '0')}:${(_timerSeconds % 60).toString().padLeft(2, '0')}",
                        style:
                            const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                        onPressed: () {
                          // if (_isDisposed) return;
                          // handle OTP completion
                          // if (!_isDisposed) {
                          //   provider
                          //       .verifyOtp(context, otp: otpController.text)
                          //       .then((value) {
                          //     if (!_isDisposed) {
                          //       Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) => const SignUpBegin(),
                          //           ));
                          //     }
                          //   });
                          // }
                        },
                        child: Text(
                          style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.underline),
                          provider.verifyloading ? "Loading" : "SEND AGAIN",
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
