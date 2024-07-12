import 'package:dealsdray/auth/auth_provider/auth_provider.dart';
import 'package:dealsdray/home/bottom%20_nav/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpBegin extends StatefulWidget {
  const SignUpBegin({super.key});

  @override
  State<SignUpBegin> createState() => _SignUpBeginState();
}

class _SignUpBeginState extends State<SignUpBegin> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referalCodeController = TextEditingController();
  bool passwordVisibility = true;

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    "images/dealsDray.png",
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Let\'s Begin!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Please enter your credentials to proceed',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Your Email',
                ),
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: passwordVisibility,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(passwordVisibility
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordVisibility = !passwordVisibility;
                      });
                    },
                  ),
                  labelText: 'Create Password',
                ),
                validator: _validatePassword,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: referalCodeController,
                decoration: const InputDecoration(
                  labelText: 'Referral code (Optional)',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          provider
                              .registerUserDetails(context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  referralCode: referalCodeController.text)
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BottomNavApp(),
                                ));
                          });
                        }
                      },
                      child: provider.verifyloading
                          ? const CircularProgressIndicator()
                          : const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                    ),
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
