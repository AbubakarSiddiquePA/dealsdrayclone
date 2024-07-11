import 'package:flutter/material.dart';

class SignUpBegin extends StatefulWidget {
  const SignUpBegin({super.key});

  @override
  State<SignUpBegin> createState() => _SignUpBeginState();
}

class _SignUpBeginState extends State<SignUpBegin> {
  bool isPhoneSelected = true;
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Your Email',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
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
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Referral code (Optional)',
              ),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
